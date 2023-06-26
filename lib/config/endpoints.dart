abstract class Endpoints {
  static const host = 'http://192.168.0.104:4500/Node.js';
  static const api = '$host/api';

  /// ! auth
  static const register = '/v6/use/signUP';
  static const login = '/v6/use/login';
  static const cities = '/v6/use/getallGovernorates';
  static const grades = '/v6/use/getallgrades';
  static const subject = '/v6/use/subjects';
  static const schools = '/v6/use/getallschool';

  /// ! teacher
  static const addGrade = '/v6/com/addgrades';
  static const teacherHome = '/v6/com/getallTeacherPage';
  static const gradeExercise = '/v6/com/getallexamsofgrades';
  static const addExam = '/v6/com/addexam';
  static const deletExam = '/v6/com/deleteExam';
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

  /// ! posts and comments

  static const getPosts = '/v6/post/getallpost';
  static const createPosts = '/v6/post/addPost';
  static const deletePost = '/v6/post/deletePost';
  static const getComments = '/v6/commint/getallComment';
  static const addComment = '/v6/commint/addcommint';
  static const deleteComment = '/v6/commint/addcommint';
}
