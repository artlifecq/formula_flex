package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.banghui.LeaderHead_Skin;
	import org.mokylin.skin.component.button.ButtonSkin_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GuildLeaderSkillNotice_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var headGrp:feathers.controls.Group;

		public var lb_text:feathers.controls.Label;

		public var lb_text2:feathers.controls.Label;

		public var leader0:feathers.controls.SkinnableContainer;

		public var leader1:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildLeaderSkillNotice_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 264;
			this.width = 326;
			this.elementsContent = [bg_i(),__GuildLeaderSkillNotice_Skin_UIAsset1_i(),btnClose_i(),lb_text_i(),lb_text2_i(),__GuildLeaderSkillNotice_Skin_UIAsset2_i(),headGrp_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GuildLeaderSkillNotice_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 12;
			temp.horizontalAlign = "center";
			temp.verticalAlign = "middle";
			return temp;
		}

		private function __GuildLeaderSkillNotice_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 222;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 312;
			temp.x = 7;
			temp.y = 34;
			return temp;
		}

		private function __GuildLeaderSkillNotice_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/background/quntichuansong.png";
			temp.x = 121;
			temp.y = 5;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 264;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 326;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 293;
			temp.y = 5;
			return temp;
		}

		private function headGrp_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			headGrp = temp;
			temp.name = "headGrp";
			temp.height = 118;
			temp.width = 277;
			temp.x = 27;
			temp.y = 88;
			temp.layout = __GuildLeaderSkillNotice_Skin_HorizontalLayout1_i();
			temp.elementsContent = [leader0_i(),leader1_i()];
			return temp;
		}

		private function lb_text2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_text2 = temp;
			temp.name = "lb_text2";
			temp.leading = 4;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "点击头像传送到统帅身边";
			temp.textAlign = "center";
			temp.color = 0x00FF0C;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.verticalAlign = "middle";
			temp.width = 284;
			temp.x = 21;
			temp.y = 216;
			return temp;
		}

		private function lb_text_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_text = temp;
			temp.name = "lb_text";
			temp.height = 50;
			temp.leading = 4;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "以下统帅向大家发出集体号召，是否相应";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.verticalAlign = "middle";
			temp.width = 284;
			temp.x = 21;
			temp.y = 48;
			return temp;
		}

		private function leader0_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			leader0 = temp;
			temp.name = "leader0";
			temp.height = 100;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.LeaderHead_Skin()
			temp.skin = skin
			temp.width = 107;
			temp.x = 55;
			temp.y = 18;
			return temp;
		}

		private function leader1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			leader1 = temp;
			temp.name = "leader1";
			temp.height = 100;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.LeaderHead_Skin()
			temp.skin = skin
			temp.width = 107;
			temp.x = 55;
			temp.y = 18;
			return temp;
		}

	}
}