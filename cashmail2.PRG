PRIVATE objSmtpMail, strError, numResultCode

objSmtpMail = CREATEOBJECT("AddEmail.SmtpMail")

objSmtpMail.SmtpServer = "ajay.kalra5@gmail.com"

objSmtpMail.SmtpUsername = "jsmith"

objSmtpMail.SmtpPassword = "ajaykalra.374"

strError = ""

numResultCode = objSmtpMail.SimpleSendAttachment("ajay.kalra5@gmail.com", "test", "Test message", "d:\emaildoc\expense.pdf", @strError)

IF numResultCode = 0 THEN

  do MESSAGE with("Sent successfully!")

ELSE

  do MESSAGE with(strError)

ENDIF

