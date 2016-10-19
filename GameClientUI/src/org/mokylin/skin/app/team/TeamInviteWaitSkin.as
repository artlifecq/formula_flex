package org.mokylin.skin.app.team
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
	import org.mokylin.skin.component.check.CheckBoxSkin_3;
	import org.mokylin.skin.component.list.EquipListSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TeamInviteWaitSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var autoAgree:feathers.controls.Check;

		public var btnAll:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var group:feathers.controls.Group;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamInviteWaitSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 320;
			this.width = 620;
			this.elementsContent = [__TeamInviteWaitSkin_UIAsset1_i(),__TeamInviteWaitSkin_UIAsset2_i(),__TeamInviteWaitSkin_Label1_i(),btnClose_i(),autoAgree_i(),__TeamInviteWaitSkin_UIAsset3_i(),list_i(),btnAll_i(),group_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TeamInviteWaitSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 16;
			temp.text = "组队邀请";
			temp.textAlign = "center";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 78;
			temp.x = 263;
			temp.y = 4;
			return temp;
		}

		private function __TeamInviteWaitSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "玩家名字";
			temp.textAlign = "center";
			temp.color = 0xCAAF94;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 150;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __TeamInviteWaitSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "等级";
			temp.textAlign = "center";
			temp.color = 0xCAAF94;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 50;
			temp.x = 150;
			temp.y = 4;
			return temp;
		}

		private function __TeamInviteWaitSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "队伍人数";
			temp.textAlign = "center";
			temp.color = 0xCAAF94;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 200;
			temp.y = 4;
			return temp;
		}

		private function __TeamInviteWaitSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "战斗力";
			temp.textAlign = "center";
			temp.color = 0xCAAF94;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 135;
			temp.x = 285;
			temp.y = 4;
			return temp;
		}

		private function __TeamInviteWaitSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "操作";
			temp.textAlign = "center";
			temp.color = 0xCAAF94;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 151;
			temp.x = 420;
			temp.y = 4;
			return temp;
		}

		private function __TeamInviteWaitSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 320;
			temp.styleName = "ui/common/backgound/di_ban.png";
			temp.width = 620;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TeamInviteWaitSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 27;
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/backgound/gao_guang.png";
			temp.width = 618;
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function __TeamInviteWaitSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 230;
			temp.styleName = "ui/common/version_3/D_di/di_4.png";
			temp.width = 590;
			temp.x = 15;
			temp.y = 35;
			return temp;
		}

		private function __TeamInviteWaitSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 28;
			temp.styleName = "ui/common/liebiao/lie_biao_di.png";
			temp.width = 584;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function autoAgree_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			autoAgree = temp;
			temp.name = "autoAgree";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "拒绝所有组队邀请（之后可在系统设置界面进行修改）";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_3);
			temp.textAlign = "left";
			temp.color = 0x9C8049;
			temp.width = 388;
			temp.x = 20;
			temp.y = 273;
			return temp;
		}

		private function btnAll_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAll = temp;
			temp.name = "btnAll";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 35;
			temp.label = "全部拒绝";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 90;
			temp.x = 480;
			temp.y = 269;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 29;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_close);
			temp.width = 30;
			temp.x = 590;
			temp.y = -2;
			return temp;
		}

		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.height = 30;
			temp.width = 585;
			temp.x = 18;
			temp.y = 38;
			temp.elementsContent = [__TeamInviteWaitSkin_UIAsset4_i(),__TeamInviteWaitSkin_Label2_i(),__TeamInviteWaitSkin_Label3_i(),__TeamInviteWaitSkin_Label4_i(),__TeamInviteWaitSkin_Label5_i(),__TeamInviteWaitSkin_Label6_i()];
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 188;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.EquipListSkin);
			temp.width = 580;
			temp.x = 20;
			temp.y = 70;
			return temp;
		}

	}
}