;;;; Copyright (c) Jeremy English <jhe@jeremyenglish.org>

;;;; Permission to use, copy, modify, distribute, and sell this
;;;; software and its documentation for any purpose is hereby granted
;;;; without fee, provided that the above copyright notice appear in
;;;; all copies and that both that copyright notice and this
;;;; permission notice appear in supporting documentation.  No
;;;; representations are made about the suitability of this software
;;;; for any purpose.  It is provided "as is" without express or
;;;; implied warranty.

;;;; Created: 13-January-2008

;;;; This program will dump all of the dcb statements in a assemble
;;;; file to a png file. It also has a function that will print the
;;;; dcb statement aligned to the column limit of m6502.


(defpackage dcb-data
  (:use #:cl #:cl-ppcre #:zpng))
(in-package :dcb-data)

(defun get-dcb-data (file)
  (let ((data '()))
  (with-open-file (in file)
    (loop
       (let ((line (read-line in nil)))
         (when (null line) (return))
         (multiple-value-bind (full-string matches)
             (scan-to-strings "(dcb)(.+)" line)
             (declare (ignore full-string))
           (when matches
             (push (aref matches 1) data))))))
  (nreverse data)))

(defun hex-string-to-int (string-value)
  (let ((lisp-hex (regex-replace "\\$" string-value "#x")))
    (read-from-string lisp-hex)))

(defun dcb-data-stream (data-list)
  (let ((data '())
        (cleaner (format nil "(~a|~a|~a)"
                         (string #\return)
                         (string #\space)
                         (string #\tab))))
    (dolist (item data-list)
      (let* ((cleaned-item (regex-replace-all cleaner item ""))
             (digits (split "," cleaned-item)))
        (dolist (n digits)
          (let ((converted
                 (if (scan "\\$.+" n)
                     (hex-string-to-int n)
                     (parse-integer n))))
          (push converted data)))))
    (nreverse data)))

(defun get-6502-color (pixel)
  (let ((index (logand pixel #xf)))
    (case index
      (0 (values #x00 #x00 #x00))
      (1 (values #xff #xff #xff))
      (2 (values #x88 #x00 #x00))
      (3 (values #xaa #xff #xee))
      (4 (values #xcc #x44 #xcc))
      (5 (values #x00 #xcc #x55))
      (6 (values #x00 #x00 #xaa))
      (7 (values #xee #xee #x77))
      (8 (values #xdd #x88 #x55))
      (9 (values #x66 #x44 #x00))
      (10 (values #xff #x77 #x77))
      (11 (values #x33 #x33 #x33))
      (12 (values #x77 #x77 #x77))
      (13 (values #xaa #xff #x66))
      (14 (values #x00 #x88 #xff))
      (15 (values #xbb #xbb #xbb)))))

(defun output-dcb-data-png (data-list width file)
  (let* ((height (round (/ (length data-list) width)))
         (png (make-instance 'png
                             :color-type :truecolor
                             :width width
                             :height height))
         (image (zpng:data-array png)))
    (dotimes (y height)
      (dotimes (x width)
        (let* ((offset (+ (* y width) x))
               (pixel (nth offset data-list)))
          (multiple-value-bind (red green blue)
              (get-6502-color pixel)
          (setf (aref image y x 0) red)
          (setf (aref image y x 1) green)
          (setf (aref image y x 2) blue)))))
    (zpng:write-png png file)))

(defun dump-dcb-data (width input-file output-file)
  (output-dcb-data-png
   (dcb-data-stream (get-dcb-data input-file))
   width output-file))

(defun dcb-pretty-print (data-list &key (type :decimal))
  "Pretty print the data-list to 24 item columns. The type can be
either decimal or hex"
  (let ((ideal-length 24))
    (dotimes (counter (length data-list))
      (let ((idx (mod counter ideal-length))
            (item (nth counter data-list)))
        (flet ((need-comma ()
                           (or (= idx (1- ideal-length))
                               (= counter (1- (length data-list))))))
        (when (zerop idx)
          (format t "~%dcb "))
        (when (equal type :decimal)
          (if (need-comma)
              (format t "~a" item)
            (format t "~a," item)))
        (when (equal type :hex)
          (if (need-comma)
              (format t "$~x" item)
            (format t "$~x," item))))))))

(defun dcb-pretty-print-file (filename &key (type :decimal))
  (dcb-pretty-print (dcb-data-stream (get-dcb-data filename))
                    :type type))

(defun collect (lat n)
  (labels ((local-collect (lat new-lat number-of-atoms counter)
                        (cond
                         ((= counter number-of-atoms)
                          (nreverse new-lat))
                         (t
                          (local-collect (rest lat) (cons (first lat) new-lat)
                                         number-of-atoms (1+ counter))))))
    (local-collect lat '() n 0)))
