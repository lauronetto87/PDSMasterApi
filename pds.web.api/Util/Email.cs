using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace pds.web.api.Util
{
    public static class Email
    {
        /// <summary>
        /// Enviar email
        /// </summary>
        /// <param name="email">Destinatário</param>
        /// <param name="assunto">Assunto</param>
        /// <param name="texto">Corpo do email</param>
        public static void EnviarEmail(string email, string assunto, string texto)
        {
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            client.Port = 587;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("noreply@ma9.com.br", "NoReplyma9*123");

            MailMessage mail = new MailMessage();
            mail.Sender = new MailAddress("noreply@ma9.com.br");
            mail.From = new MailAddress("noreply@ma9.com.br");
            mail.To.Add(new MailAddress(email));
            mail.Subject = assunto;
            mail.Body = texto;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;

            try
            {
                client.Send(mail);
            }
            catch (System.Exception erro)
            {
                throw new Exception(erro.Message);
            }
        }
    }
}