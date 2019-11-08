# Note that .sh scripts work only on Mac. If you're on Windows, install Git Bash and use that as your client.

echo 'Killing all Jekyll instances'
kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')
clear

echo 'Deleting all old pdfs'
rm pdf/$1.pdf;
echo "done";

echo "Building PDF-friendly HTML site for Mydoc ...";
bundle exec jekyll serve --detach --config _config.yml,pdfconfigs/config_mydoc_pdf.yml;
echo "done";

echo "Building the PDF ...";
prince --javascript --pdf-keywords=prince-no-fallback --input-list=_site/pdfconfigs/prince-list.txt -o pdf/$1.pdf;

echo "Done. Look in the pdf directory to see if it printed successfully."

open pdf/$1.pdf;
