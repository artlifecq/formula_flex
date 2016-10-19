package org.mokylin.skin.mainui.head
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.button.ButtonSkin_pk_btn;
	import org.mokylin.skin.component.button.ButtonSkin_teamJun;
	import org.mokylin.skin.component.button.ButtonSkin_teamLie;
	import org.mokylin.skin.component.button.ButtonSkin_teamLun;
	import org.mokylin.skin.component.button.ButtonSkin_teamShang;
	import org.mokylin.skin.component.button.ButtonSkin_teamZi;
	import org.mokylin.skin.component.button.ButtonSkin_vip;
	import org.mokylin.skin.component.uinumber.UINumberSkin_yellow_middle;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PlayerHeadBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnJun:feathers.controls.Button;

		public var btnLie:feathers.controls.Button;

		public var btnLun:feathers.controls.Button;

		public var btnPk:feathers.controls.Button;

		public var btnShang:feathers.controls.Button;

		public var btnVip:feathers.controls.Button;

		public var btnZi:feathers.controls.Button;

		public var duiZhang:feathers.controls.UIAsset;

		public var imgBreed:feathers.controls.UIAsset;

		public var imgHeadIco:feathers.controls.UIAsset;

		public var imgJob:feathers.controls.UIAsset;

		public var imgLife:feathers.controls.UIAsset;

		public var imgMp:feathers.controls.UIAsset;

		public var jobBg:feathers.controls.UIAsset;

		public var labHP:feathers.controls.Label;

		public var labLevel:feathers.controls.UINumber;

		public var labName:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PlayerHeadBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 116;
			this.width = 330;
			labelFilterBlack_i();
			this.elementsContent = [bg_i(),imgHeadIco_i(),imgLife_i(),btnVip_i(),labHP_i(),labName_i(),jobBg_i(),imgJob_i(),imgMp_i(),labLevel_i(),btnPk_i(),duiZhang_i(),btnShang_i(),btnJun_i(),btnLun_i(),btnLie_i(),btnZi_i(),imgBreed_i()];
			
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
			temp.styleName = "ui/mainui/head/touxiang_di.png";
			temp.x = 15;
			temp.y = 25;
			return temp;
		}

		private function btnJun_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJun = temp;
			temp.name = "btnJun";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_teamJun);
			temp.x = 11;
			temp.y = 16;
			return temp;
		}

		private function btnLie_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLie = temp;
			temp.name = "btnLie";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_teamLie);
			temp.x = 11;
			temp.y = 32;
			return temp;
		}

		private function btnLun_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLun = temp;
			temp.name = "btnLun";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_teamLun);
			temp.x = 11;
			temp.y = 32;
			return temp;
		}

		private function btnPk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPk = temp;
			temp.name = "btnPk";
			temp.label = "和平";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_pk_btn);
			temp.x = 36;
			temp.y = 63;
			return temp;
		}

		private function btnShang_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnShang = temp;
			temp.name = "btnShang";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_teamShang);
			temp.x = 11;
			temp.y = 16;
			return temp;
		}

		private function btnVip_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnVip = temp;
			temp.name = "btnVip";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_vip);
			temp.x = 286;
			temp.y = 12;
			return temp;
		}

		private function btnZi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZi = temp;
			temp.name = "btnZi";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_teamZi);
			temp.x = 11;
			temp.y = 32;
			return temp;
		}

		private function duiZhang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			duiZhang = temp;
			temp.name = "duiZhang";
			temp.styleName = "ui/mainui/head/duizhang.png";
			temp.x = 11;
			temp.y = 0;
			return temp;
		}

		private function imgBreed_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBreed = temp;
			temp.name = "imgBreed";
			temp.styleName = "ui/common/icon/zhan-.png";
			temp.x = 8;
			temp.y = 77;
			return temp;
		}

		private function imgHeadIco_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgHeadIco = temp;
			temp.name = "imgHeadIco";
			temp.styleName = "ui/mainui/head/renwutouxiang.png";
			temp.x = 28;
			temp.y = 0;
			return temp;
		}

		private function imgJob_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgJob = temp;
			temp.name = "imgJob";
			temp.styleName = "ui/mainui/head/job/fashizhiyedatu.png";
			temp.x = 8;
			temp.y = 50;
			return temp;
		}

		private function imgLife_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLife = temp;
			temp.name = "imgLife";
			temp.styleName = "ui/mainui/head/touxiang_xuetiao.png";
			temp.width = 213;
			temp.x = 88;
			temp.y = 39;
			return temp;
		}

		private function imgMp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgMp = temp;
			temp.name = "imgMp";
			temp.height = 7;
			temp.styleName = "ui/mainui/head/touxiang_lantiao.png";
			temp.width = 156;
			temp.x = 88;
			temp.y = 56;
			return temp;
		}

		private function jobBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jobBg = temp;
			temp.name = "jobBg";
			temp.styleName = "ui/mainui/head/zhiye_di.png";
			temp.x = 0;
			temp.y = 42;
			return temp;
		}

		private function labHP_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labHP = temp;
			temp.name = "labHP";
			temp.bold = false;
			temp.text = "1000/1000";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.width = 169;
			temp.x = 109;
			temp.y = 37;
			return temp;
		}

		private function labLevel_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			labLevel = temp;
			temp.name = "labLevel";
			temp.gap = -5;
			temp.height = 25;
			temp.label = "100";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.uinumber.UINumberSkin_yellow_middle);
			temp.width = 55;
			temp.x = 85;
			temp.y = 11;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.bold = true;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.letterSpacing = 1;
			temp.fontSize = 15;
			temp.text = "名字";
			temp.color = 0xEAE9E8;
			temp.width = 150;
			temp.x = 135;
			temp.y = 14;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1.00;
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