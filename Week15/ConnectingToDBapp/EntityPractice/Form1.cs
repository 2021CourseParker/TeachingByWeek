using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EntityPractice
{
    public partial class SchoolForm : Form
    {
        public SchoolForm()
        {
            InitializeComponent();
        }

        private void btnSelectStudent_Click(object sender, EventArgs e)
        {
            SchoolDBEntities db = new SchoolDBEntities();
            string studentName = "Bill";
            string sql = "Select * from student where studentName = '" + studentName + "'";
            List<Student> students = db.Students.SqlQuery(sql).ToList<Student>();

            string output = string.Empty;
            foreach (var student in students)
            {
                output = output + student.StudentName +" " + student.StandardId + Environment.NewLine;
            }

            MessageBox.Show(output);

            
            db.Dispose();
        }



        private void btnInsertStudent_Click(object sender, EventArgs e)
        {
            SchoolDBEntities db = new SchoolDBEntities();

            // instead insert query we use this:
            Student student = new Student();
            student.StudentName = "Someone";
            student.StandardId = 1;
            db.Students.Add(student);

            int output = db.SaveChanges();
            
            MessageBox.Show(output.ToString());

            db.Dispose();
        }

        private void btnUpdateStudent_Click(object sender, EventArgs e)
        {
            SchoolDBEntities db = new SchoolDBEntities();

            // instead update query we use this:            
            Student student = db.Students.First<Student>();     // Ok this is first but how to find someone by name, or id?
            student.StudentName = "Bill";
            int output = db.SaveChanges();

            MessageBox.Show(output.ToString());

            db.Dispose();
        }

        private void btnDeleteStudent_Click(object sender, EventArgs e)
        {
            SchoolDBEntities db = new SchoolDBEntities();

            // instead delete query we use this:
            Student student = db.Students.First<Student>();     // Ok this is first but how to find someone by name, or id?
            db.Students.Remove(student);
            int output = db.SaveChanges();

            MessageBox.Show(output.ToString());

            db.Dispose();
        }
    }
}
