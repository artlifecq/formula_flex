package org.mokylin.skin.app.citan
{
	import feathers.controls.text.Fontter;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.citan.mc.UIMovieClipSkin_xinfeng;
	import org.mokylin.skin.app.citan.radio.RadioButtonSkin_quan;
	import org.mokylin.skin.component.button.ButtonSkin_close_big;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CitanPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnMail_0:feathers.controls.Radio;

		public var btnMail_1:feathers.controls.Radio;

		public var btnMail_2:feathers.controls.Radio;

		public var btnMail_3:feathers.controls.Radio;

		public var btnMail_4:feathers.controls.Radio;

		public var btnQingbao:feathers.controls.Button;

		public var btnQingbao0:feathers.controls.Button;

		public var grid0:feathers.controls.UIAsset;

		public var grid1:feathers.controls.UIAsset;

		public var grid2:feathers.controls.UIAsset;

		public var labDesc:feathers.controls.Label;

		public var labExp:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var mcMail_0:feathers.controls.UIMovieClip;

		public var mcMail_1:feathers.controls.UIMovieClip;

		public var mcMail_2:feathers.controls.UIMovieClip;

		public var mcMail_3:feathers.controls.UIMovieClip;

		public var mcMail_4:feathers.controls.UIMovieClip;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CitanPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 326;
			this.width = 590;
			labelFilterBlack_i();
			this.elementsContent = [__CitanPanelSkin_UIAsset1_i(),btnQingbao_i(),btnQingbao0_i(),__CitanPanelSkin_UIAsset2_i(),btnClose_i(),btnMail_0_i(),btnMail_1_i(),btnMail_2_i(),btnMail_3_i(),btnMail_4_i(),mcMail_0_i(),mcMail_1_i(),mcMail_2_i(),mcMail_3_i(),mcMail_4_i(),grid0_i(),grid1_i(),grid2_i(),labExp_i(),labDesc_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CitanPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/citan/chitan_bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CitanPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/npc/exp.png";
			temp.x = 92;
			temp.y = 195;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 37;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close_big;
			temp.width = 41;
			temp.x = 530;
			temp.y = 20;
			return temp;
		}

		private function btnMail_0_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnMail_0 = temp;
			temp.name = "btnMail_0";
			temp.groupName = "citanPanel_radioGrp";
			temp.height = 156;
			temp.touchable = false;
			temp.styleClass = org.mokylin.skin.app.citan.radio.RadioButtonSkin_quan;
			temp.width = 157;
			temp.x = 25;
			temp.y = 40;
			return temp;
		}

		private function btnMail_1_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnMail_1 = temp;
			temp.name = "btnMail_1";
			temp.groupName = "citanPanel_radioGrp";
			temp.height = 156;
			temp.touchable = false;
			temp.styleClass = org.mokylin.skin.app.citan.radio.RadioButtonSkin_quan;
			temp.width = 157;
			temp.x = 125;
			temp.y = 40;
			return temp;
		}

		private function btnMail_2_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnMail_2 = temp;
			temp.name = "btnMail_2";
			temp.groupName = "citanPanel_radioGrp";
			temp.height = 156;
			temp.touchable = false;
			temp.styleClass = org.mokylin.skin.app.citan.radio.RadioButtonSkin_quan;
			temp.width = 157;
			temp.x = 225;
			temp.y = 40;
			return temp;
		}

		private function btnMail_3_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnMail_3 = temp;
			temp.name = "btnMail_3";
			temp.groupName = "citanPanel_radioGrp";
			temp.height = 156;
			temp.touchable = false;
			temp.styleClass = org.mokylin.skin.app.citan.radio.RadioButtonSkin_quan;
			temp.width = 157;
			temp.x = 325;
			temp.y = 40;
			return temp;
		}

		private function btnMail_4_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnMail_4 = temp;
			temp.name = "btnMail_4";
			temp.groupName = "citanPanel_radioGrp";
			temp.height = 156;
			temp.touchable = false;
			temp.styleClass = org.mokylin.skin.app.citan.radio.RadioButtonSkin_quan;
			temp.width = 157;
			temp.x = 425;
			temp.y = 40;
			return temp;
		}

		private function btnQingbao0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnQingbao0 = temp;
			temp.name = "btnQingbao0";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "更新情报";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;
			temp.color = 0xF9F0CC;
			temp.x = 225;
			temp.y = 240;
			return temp;
		}

		private function btnQingbao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnQingbao = temp;
			temp.name = "btnQingbao";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "换取情报";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;
			temp.color = 0xF9F0CC;
			temp.x = 225;
			temp.y = 240;
			return temp;
		}

		private function grid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid0 = temp;
			temp.name = "grid0";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 280;
			temp.y = 189;
			return temp;
		}

		private function grid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid1 = temp;
			temp.name = "grid1";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 351;
			temp.y = 189;
			return temp;
		}

		private function grid2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid2 = temp;
			temp.name = "grid2";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 421;
			temp.y = 189;
			return temp;
		}

		private function labDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc = temp;
			temp.name = "labDesc";
			temp.text = "我这里有一些价值的情报，你需要吗？";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 509;
			temp.x = 35;
			temp.y = 40;
			return temp;
		}

		private function labExp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labExp = temp;
			temp.name = "labExp";
			temp.letterSpacing = 2;
			temp.fontSize = 14;
			temp.text = "10000000";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 170;
			temp.y = 200;
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
			temp.strength = 5;
			return temp;
		}

		private function mcMail_0_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mcMail_0 = temp;
			temp.name = "mcMail_0";
			temp.autoPlay = false;
			temp.styleClass = org.mokylin.skin.app.citan.mc.UIMovieClipSkin_xinfeng;
			temp.x = 40;
			temp.y = 80;
			return temp;
		}

		private function mcMail_1_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mcMail_1 = temp;
			temp.name = "mcMail_1";
			temp.autoPlay = false;
			temp.styleClass = org.mokylin.skin.app.citan.mc.UIMovieClipSkin_xinfeng;
			temp.x = 140;
			temp.y = 80;
			return temp;
		}

		private function mcMail_2_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mcMail_2 = temp;
			temp.name = "mcMail_2";
			temp.autoPlay = false;
			temp.styleClass = org.mokylin.skin.app.citan.mc.UIMovieClipSkin_xinfeng;
			temp.x = 240;
			temp.y = 80;
			return temp;
		}

		private function mcMail_3_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mcMail_3 = temp;
			temp.name = "mcMail_3";
			temp.autoPlay = false;
			temp.styleClass = org.mokylin.skin.app.citan.mc.UIMovieClipSkin_xinfeng;
			temp.x = 340;
			temp.y = 80;
			return temp;
		}

		private function mcMail_4_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mcMail_4 = temp;
			temp.name = "mcMail_4";
			temp.autoPlay = false;
			temp.styleClass = org.mokylin.skin.app.citan.mc.UIMovieClipSkin_xinfeng;
			temp.x = 440;
			temp.y = 80;
			return temp;
		}

	}
}