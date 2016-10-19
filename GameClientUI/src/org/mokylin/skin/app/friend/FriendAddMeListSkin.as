package org.mokylin.skin.app.friend
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.list.ListSkin2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FriendAddMeListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var agreeAll:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FriendAddMeListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__FriendAddMeListSkin_UIAsset1_i(),__FriendAddMeListSkin_UIAsset2_i(),list_i(),__FriendAddMeListSkin_UIAsset3_i(),__FriendAddMeListSkin_Label1_i(),__FriendAddMeListSkin_Label2_i(),__FriendAddMeListSkin_Label3_i(),__FriendAddMeListSkin_Label4_i(),__FriendAddMeListSkin_Label5_i(),btnClose_i(),__FriendAddMeListSkin_UIAsset4_i(),__FriendAddMeListSkin_Label6_i(),agreeAll_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FriendAddMeListSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "玩家名称";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 129;
			temp.x = 23;
			temp.y = 53;
			return temp;
		}

		private function __FriendAddMeListSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "等级";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 50;
			temp.x = 156;
			temp.y = 53;
			return temp;
		}

		private function __FriendAddMeListSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "国家";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 226;
			temp.y = 53;
			return temp;
		}

		private function __FriendAddMeListSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "操作";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 384;
			temp.y = 53;
			return temp;
		}

		private function __FriendAddMeListSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "好友申请";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 235;
			temp.y = 13;
			return temp;
		}

		private function __FriendAddMeListSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "关闭此提示界面将被视为拒绝本次所有申请";
			temp.color = 0xC21515;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 53;
			temp.y = 407;
			return temp;
		}

		private function __FriendAddMeListSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 453;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 521;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FriendAddMeListSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 349;
			temp.styleName = "ui/mainui/chat/shurukuang.png";
			temp.width = 489;
			temp.x = 18;
			temp.y = 43;
			return temp;
		}

		private function __FriendAddMeListSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/L_liebiao/lie_biao_di_1.png";
			temp.width = 483;
			temp.x = 22;
			temp.y = 47;
			return temp;
		}

		private function __FriendAddMeListSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/B_bujian/jingshi.png";
			temp.x = 25;
			temp.y = 404;
			return temp;
		}

		private function agreeAll_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			agreeAll = temp;
			temp.name = "agreeAll";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 32;
			temp.label = "全部同意";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
			temp.color = 0xF9F0CC;
			temp.width = 104;
			temp.x = 397;
			temp.y = 400;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
			temp.x = 487;
			temp.y = 4;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 313;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin2;
			temp.width = 478;
			temp.x = 24;
			temp.y = 76;
			return temp;
		}

	}
}