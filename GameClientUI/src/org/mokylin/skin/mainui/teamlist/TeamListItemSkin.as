package org.mokylin.skin.mainui.teamlist
{
	import feathers.controls.text.Fontter;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.button.ButtonSkin_teamJun;
	import org.mokylin.skin.component.button.ButtonSkin_teamLie;
	import org.mokylin.skin.component.button.ButtonSkin_teamLun;
	import org.mokylin.skin.component.button.ButtonSkin_teamShang;
	import org.mokylin.skin.component.button.ButtonSkin_teamZi;
	import org.mokylin.skin.component.uinumber.UINumberSkin_yellow_min;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TeamListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnJun:feathers.controls.Button;

		public var btnLie:feathers.controls.Button;

		public var btnLun:feathers.controls.Button;

		public var btnShang:feathers.controls.Button;

		public var btnZi:feathers.controls.Button;

		public var duiZhang:feathers.controls.UIAsset;

		public var group:feathers.controls.Group;

		public var hpOrMpTips:feathers.controls.Group;

		public var imgHp:feathers.controls.UIAsset;

		public var imgIcon:feathers.controls.UIAsset;

		public var imgMp:feathers.controls.UIAsset;

		public var labLevel:feathers.controls.UINumber;

		public var labName:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 50;
			this.width = 210;
			labelFilterBlack_i();
			this.elementsContent = [group_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 43;
			temp.styleName = "ui/app/team/zudui_di.png";
			temp.width = 160;
			temp.x = 13;
			temp.y = 5;
			return temp;
		}

		private function btnJun_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJun = temp;
			temp.name = "btnJun";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_teamJun;
			temp.x = 0;
			temp.y = 16;
			return temp;
		}

		private function btnLie_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLie = temp;
			temp.name = "btnLie";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_teamLie;
			temp.x = 0;
			temp.y = 32;
			return temp;
		}

		private function btnLun_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLun = temp;
			temp.name = "btnLun";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_teamLun;
			temp.x = 0;
			temp.y = 32;
			return temp;
		}

		private function btnShang_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnShang = temp;
			temp.name = "btnShang";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_teamShang;
			temp.x = 0;
			temp.y = 16;
			return temp;
		}

		private function btnZi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZi = temp;
			temp.name = "btnZi";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_teamZi;
			temp.x = 0;
			temp.y = 32;
			return temp;
		}

		private function duiZhang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			duiZhang = temp;
			temp.name = "duiZhang";
			temp.styleName = "ui/mainui/head/duizhang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.x = 2;
			temp.y = 0;
			temp.elementsContent = [bg_i(),imgHp_i(),labName_i(),imgMp_i(),labLevel_i(),duiZhang_i(),btnShang_i(),btnJun_i(),btnLun_i(),btnLie_i(),btnZi_i(),hpOrMpTips_i(),imgIcon_i()];
			return temp;
		}

		private function hpOrMpTips_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			hpOrMpTips = temp;
			temp.name = "hpOrMpTips";
			temp.height = 19;
			temp.width = 120;
			temp.x = 50;
			temp.y = 21;
			return temp;
		}

		private function imgHp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgHp = temp;
			temp.name = "imgHp";
			temp.height = 7;
			temp.styleName = "ui/app/team/zudui_xue.png";
			temp.width = 115;
			temp.x = 51;
			temp.y = 25;
			return temp;
		}

		private function imgIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgIcon = temp;
			temp.name = "imgIcon";
			temp.height = 30;
			temp.styleName = "ui/common/version_3/T_tubiao/T_tongyongxiaotubiao/job_badao.png";
			temp.width = 28;
			temp.x = 20;
			temp.y = 10;
			return temp;
		}

		private function imgMp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgMp = temp;
			temp.name = "imgMp";
			temp.height = 3;
			temp.styleName = "ui/mainui/head/touxiang_lantiao.png";
			temp.width = 86;
			temp.x = 49;
			temp.y = 35;
			return temp;
		}

		private function labLevel_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			labLevel = temp;
			temp.name = "labLevel";
			temp.gap = -5;
			temp.height = 20;
			temp.label = "100";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_yellow_min;
			temp.width = 55;
			temp.x = 48;
			temp.y = 4;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.bold = true;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 21;
			temp.letterSpacing = 1;
			temp.fontSize = 12;
			temp.text = "名字";
			temp.color = 0xEAE9E8;
			temp.width = 120;
			temp.x = 90;
			temp.y = 6;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 4;
			return temp;
		}

	}
}