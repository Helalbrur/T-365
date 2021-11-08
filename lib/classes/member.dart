
class Member{
  final String id;
  final String name;
  final String email;
  final String password;
  final String role;
  final String first_name;
  final String last_name;
  final String mobile;
  final String address;
  final String father;
  final String mother;

  Member({required this.name,required this.email,required this.password,this.role='member',this.id='',this.mobile='',this.first_name='',this.last_name='',this.address='',this.father='',this.mother=''});

}