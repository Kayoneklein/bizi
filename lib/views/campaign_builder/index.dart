import 'dart:io';

import 'package:bizi/config.dart';
import 'package:bizi/constants/b_colors.dart';
import 'package:bizi/constants/b_icons.dart';
import 'package:bizi/constants/route_names.dart';
import 'package:bizi/constants/text_localizations.dart';
import 'package:bizi/models/create_campaign_model.dart';
import 'package:bizi/models/photo_model.dart';
import 'package:bizi/redux/actions/campaign_builder_actions.dart';
import 'package:bizi/redux/states/app_state.dart';
import 'package:bizi/redux/states/campaign_builder.dart';
import 'package:bizi/service/overlay_service.dart';
import 'package:bizi/views/campaign_builder/widgets/gallery_view.dart';
import 'package:bizi/views/widgets/bizi_app_wrapper.dart';
import 'package:bizi/views/widgets/bizi_text_field.dart';
import 'package:bizi/views/widgets/button.dart';
import 'package:bizi/views/widgets/cached_image.dart';
import 'package:bizi/views/widgets/custom_text.dart';
import 'package:bizi/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get.dart';
import 'package:giphy_get/giphy_get.dart';
import 'package:redux/redux.dart';
import 'package:unsplash_client/unsplash_client.dart';

part './screens/campaign_builder.dart';
part './controllers/campaign_button_controller.dart';
part './widgets/button_action_icons.dart';
part './widgets/button_placement_component.dart';
part './widgets/campaign_detail_option.dart';
part './model/campaign_builder_view_model.dart';
part './screens/campaign_image_builder.dart';
part './widgets/unsplash_image_display.dart';
part './widgets/pexels_image_display.dart';
part './widgets/giphy_image_display.dart';
part './controllers/image_builder_controller.dart';
part './widgets/image_search_field.dart';
part './widgets/image_tabs_display.dart';
part './widgets/media_preview.dart';
part './model/button_color_model.dart';
part './model/button_action_link_model.dart';
part './widgets/campaign_row_items.dart';
part './widgets/delete_text_field.dart';
part './widgets/delete_component_button.dart';
part './widgets/image_option_button.dart';
part './widgets/image_row_select.dart';
part './widgets/edit_button_panel.dart';
part './widgets/text_component_edit.dart';
part 'widgets/text_bottom_sheet.dart';
part 'widgets/action_bottom_sheet.dart';
part 'model/button_placement_model.dart';
part 'widgets/leave_campaign_builder_button.dart';
part 'widgets/element_box.dart';
part 'widgets/campaign_bottom_nav.dart';
part 'widgets/image_element.dart';
