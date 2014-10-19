namespace Students
{
    using System;
    using System.Linq;
    using System.Web.UI.HtmlControls;

    public partial class StudentRegistration : System.Web.UI.Page
    {
        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            var courses = this.Courses.Items;
            var student = new
            {
                FirstName = this.FirstName.Text,
                LastName = this.LastName.Text,
                FacultyNumber = this.FacultyNumber.Text,
                University = this.University.SelectedItem.Text,
                Courses = Courses.GetSelectedIndices().Select(c => courses[c])
            };

            var studentContainner = new HtmlGenericControl("fieldset");

            var heading = new HtmlGenericControl("legend");
            heading.InnerText = "Registration data:";

            var nameParagraph = new HtmlGenericControl("p");
            nameParagraph.InnerText = string.Format("Name: {0} {1}", student.FirstName, student.LastName);

            var facultyNumberParagraph = new HtmlGenericControl("p");
            facultyNumberParagraph.InnerText = string.Format("Faculty Number: {0}", student.FacultyNumber);

            var universityParagraph = new HtmlGenericControl("p");
            universityParagraph.InnerText = string.Format("University: {0}", student.University);

            var coursesParagraph = new HtmlGenericControl("p");
            coursesParagraph.InnerText = string.Format("Courses: {0}", string.Join(" ", student.Courses));

            studentContainner.Controls.Add(heading);
            studentContainner.Controls.Add(nameParagraph);
            studentContainner.Controls.Add(facultyNumberParagraph);
            studentContainner.Controls.Add(universityParagraph);
            studentContainner.Controls.Add(coursesParagraph);

            this.Controls.Add(studentContainner);
        }
    }
}