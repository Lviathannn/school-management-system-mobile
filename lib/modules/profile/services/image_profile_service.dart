import 'package:school_management_system/modules/profile/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImageProfileService {
  Future<UserModel?> getUserImageProfile() async {
    try {
      final supabase = Supabase.instance.client;
      final response = await supabase
          .from('user_data')
          .select()
          .eq("user", supabase.auth.currentUser!.id)
          .single();

      return UserModel.fromJson(response);
    } catch (e) {
      return null;
    }
  }
}
