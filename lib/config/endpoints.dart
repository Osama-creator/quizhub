abstract class Endpoints {
  static const host = 'https://tack-orcin.vercel.app/Node.js';
  static const api = '$host/api';

  /// ! auth
  static const register = '/v6/use/signUP';
  static const login = '/v6/use/login';
  static const signOut = '/v6/use/logOut';
  static const cities = '/v6/use/getallGovernorates';
  static const grades = '/v6/use/getallgrades';
  static const subject = '/v6/use/subjects';
  static const schools = '/v6/use/getallschool';
  static const addSub = '/v6/use/addsubjects';
  static const addClass = '/v6/use/addgrade';
  static const addSchool = '/v6/use//addSchool';

  /// ! teacher
  static const addGrade = '/v6/com/addgrades';
  static const teacherHome = '/v6/com/getallTeacherPage';
  static const gradeExercise = '/v6/com/getallexamsofgrades';
  static const addExam = '/v6/com/addexam';
  static const deletExam = '/v6/com/deleteExam';
  static const deletQuestion = '/v6/com/deleteQuestion';
  static const addQuesiton = '/v6/com/addQuestion';
  static const updateQuesiton = '/v6/com/updateQuestion';
  static const getExam = '/v6/com/getallexam';

  /// ! student
  static const getexamswithTeacher = '/v6/use/getallhomePage';
  static const subjectNames = '/v6/use/getSubject';
  static const postDegree = '/v6/use/thedegreeExam';
  static const getUseres = '/v6/use/getallUser';
  static const getEnvitations = '/v6/use/getallInvitations';
  static const getUsersDegrees = '/v6/use/thedegreeUsers';
  static const envite = '/v6/use/theInvitation';

  /// ! posts and comments

  static const getPosts = '/v6/post/getallpost';
  static const createPosts = '/v6/post/addPost';
  static const deletePost = '/v6/post/deletePost';
  static const getComments = '/v6/commint/getallComment';
  static const addComment = '/v6/commint/addcommint';
  static const deleteComment = '/v6/commint/deletecomment';
  static const likeComment = '/v6/commint/addLikeComment';

  /// ! parent section
  static const getStudents = '/v6/guard/getallUserToGuardian';
  static const folowStudent = '/v6/guard/followStudent';
  static const folowedStudent = '/v6/guard/parentOfUsers';
  static const getStudentProfile = '/v6/use/profileUser';

  /// ! folow teacher section
  static const getTeachers = '/v6/use/getallTeacherOfTheGrades';
  static const folowTeacher = '/v6/use/followTeacher';
  static const getFolowedTeacher = '/v6/use/UsersOfTeacher';
  static const getTeachersummery = '/v6/com/getallTeacherofStudent';

  /// ! admin
  static const getSchoolsForAdmin = '/v6/use/schoolsToStudent';
  static const getDetailsSchoolsForAdmin = '/v6/use/theSchool';
  static const getAccountOrder = '/v6/com/getallconfirmTeacher';

  /// ! financails
  static const addfollowersEP = '/v6/com/addFolower';
  static const teacherMoneyOrder = '/v6/com/cash_Withdrawal';
  static const getAddFOrders = '/v6/com/getallTeacherAddFolowers';
  static const teacherOrders = '/v6/com/TeacherOrders';
  static const confirmOrder = '/v6/com/addconfirm';
  static const getFinancialData = '/v6/com/getallReceivablesPage';
  static const moneyOrdres = '/v6/com/getallOrder';
  static const confirmationOfMoneyOrder = '/v6/com/confirmOrder';
  static const addAdvice = '/v6/com/addAdvice';
  static const getAdvice = '/v6/com/getallAdvices';
  static const confirmationOfaccount = '/v6/com/addconfirmTeacher';
  static const confirmationOfMoneyOrderResponse =
      '/v6/com/TeacherOrdersMessage';
}
