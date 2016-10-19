package org.mokylin.skin.app.team.item
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
	import org.mokylin.skin.component.check.CheckBoxSkin_3;
	import org.mokylin.skin.component.radio.RadioSkin_3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TeamMyTeamSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var applyOfAutoTeam:feathers.controls.Check;

		public var btnCreateTeam:feathers.controls.Button;

		public var btnFollow:feathers.controls.Button;

		public var btnQuitTeam:feathers.controls.Button;

		public var expHurtMode:feathers.controls.Radio;

		public var expMeanMode:feathers.controls.Radio;

		public var feedPickupMode:feathers.controls.Radio;

		public var group:feathers.controls.Group;

		public var group_teamBottom:feathers.controls.Group;

		public var imgNoTeam:feathers.controls.UIAsset;

		public var inviteAutoTeam:feathers.controls.Check;

		public var killerMode:feathers.controls.Radio;

		public var pickupMode:feathers.controls.Radio;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamMyTeamSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 425;
			this.width = 850;
			this.elementsContent = [group_teamBottom_i(),btnQuitTeam_i(),btnCreateTeam_i(),imgNoTeam_i(),group_i(),inviteAutoTeam_i(),applyOfAutoTeam_i(),btnFollow_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TeamMyTeamSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 73;
			temp.styleName = "ui/app/team/mo_shi_di_kuang.png";
			temp.width = 233;
			temp.x = 5;
			temp.y = 2;
			return temp;
		}

		private function __TeamMyTeamSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 69;
			temp.styleName = "ui/app/team/jing_yan_mo_shi.png";
			temp.width = 105;
			temp.x = 0;
			temp.y = 11;
			return temp;
		}

		private function __TeamMyTeamSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 73;
			temp.styleName = "ui/app/team/mo_shi_di_kuang.png";
			temp.width = 327;
			temp.x = 235;
			temp.y = 2;
			return temp;
		}

		private function __TeamMyTeamSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 69;
			temp.styleName = "ui/app/team/shi_qu_mo_shi.png";
			temp.width = 105;
			temp.x = 235;
			temp.y = 11;
			return temp;
		}

		private function applyOfAutoTeam_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			applyOfAutoTeam = temp;
			temp.name = "applyOfAutoTeam";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "自动同意入队申请";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_3);
			temp.textAlign = "left";
			temp.color = 0x9C8049;
			temp.width = 150;
			temp.x = 700;
			temp.y = -30;
			return temp;
		}

		private function btnCreateTeam_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCreateTeam = temp;
			temp.name = "btnCreateTeam";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 35;
			temp.label = "创建队伍";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 90;
			temp.x = 735;
			temp.y = 352;
			return temp;
		}

		private function btnFollow_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnFollow = temp;
			temp.name = "btnFollow";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 35;
			temp.label = "小队跟随";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 90;
			temp.x = 610;
			temp.y = 352;
			return temp;
		}

		private function btnQuitTeam_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnQuitTeam = temp;
			temp.name = "btnQuitTeam";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 35;
			temp.label = "退出队伍";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 90;
			temp.x = 735;
			temp.y = 352;
			return temp;
		}

		private function expHurtMode_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			expHurtMode = temp;
			temp.name = "expHurtMode";
			temp.bold = true;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "经验按伤害分配";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.textAlign = "left";
			temp.color = 0xDFC8AF;
			temp.width = 135;
			temp.x = 90;
			temp.y = 41;
			return temp;
		}

		private function expMeanMode_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			expMeanMode = temp;
			temp.name = "expMeanMode";
			temp.bold = true;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "经验平均分配";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.textAlign = "left";
			temp.color = 0xDFC8AF;
			temp.width = 135;
			temp.x = 90;
			temp.y = 17;
			return temp;
		}

		private function feedPickupMode_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			feedPickupMode = temp;
			temp.name = "feedPickupMode";
			temp.bold = true;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "自由拾取";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.textAlign = "left";
			temp.color = 0xDFC8AF;
			temp.width = 105;
			temp.x = 445;
			temp.y = 17;
			return temp;
		}

		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.height = 340;
			temp.width = 850;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function group_teamBottom_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group_teamBottom = temp;
			temp.name = "group_teamBottom";
			temp.height = 88;
			temp.width = 574;
			temp.x = 10;
			temp.y = 331;
			temp.elementsContent = [__TeamMyTeamSkin_UIAsset1_i(),__TeamMyTeamSkin_UIAsset2_i(),expHurtMode_i(),expMeanMode_i(),__TeamMyTeamSkin_UIAsset3_i(),__TeamMyTeamSkin_UIAsset4_i(),killerMode_i(),pickupMode_i(),feedPickupMode_i()];
			return temp;
		}

		private function imgNoTeam_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgNoTeam = temp;
			temp.name = "imgNoTeam";
			temp.height = 166;
			temp.styleName = "ui/app/team/wei_zu_dui.png";
			temp.width = 437;
			temp.x = 208;
			temp.y = 39;
			return temp;
		}

		private function inviteAutoTeam_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			inviteAutoTeam = temp;
			temp.name = "inviteAutoTeam";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "自动同意组队邀请";
			temp.leading = 2;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_3);
			temp.textAlign = "left";
			temp.color = 0x9C8049;
			temp.underline = false;
			temp.width = 150;
			temp.x = 509;
			temp.y = -30;
			return temp;
		}

		private function killerMode_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			killerMode = temp;
			temp.name = "killerMode";
			temp.bold = true;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "猎杀者模式";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.textAlign = "left";
			temp.color = 0xDFC8AF;
			temp.width = 105;
			temp.x = 330;
			temp.y = 41;
			return temp;
		}

		private function pickupMode_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			pickupMode = temp;
			temp.name = "pickupMode";
			temp.bold = true;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "轮流拾取";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.textAlign = "left";
			temp.color = 0xDFC8AF;
			temp.width = 105;
			temp.x = 330;
			temp.y = 17;
			return temp;
		}

	}
}