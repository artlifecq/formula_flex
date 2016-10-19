package org.mokylin.skin.app.turntable
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.turntable.button.ButtonSkin_linjiang;
	import org.mokylin.skin.app.turntable.button.ButtonSkin_start;
	import org.mokylin.skin.component.button.ButtonSkin_close_big;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TurntableSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnAward:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnStart:feathers.controls.Button;

		public var grid0:feathers.controls.UIAsset;

		public var grid1:feathers.controls.UIAsset;

		public var grid2:feathers.controls.UIAsset;

		public var grid3:feathers.controls.UIAsset;

		public var grid4:feathers.controls.UIAsset;

		public var grid5:feathers.controls.UIAsset;

		public var grid6:feathers.controls.UIAsset;

		public var grid7:feathers.controls.UIAsset;

		public var grid8:feathers.controls.UIAsset;

		public var grid9:feathers.controls.UIAsset;

		public var imgFlag:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TurntableSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 651;
			this.width = 688;
			this.elementsContent = [bg_i(),btnClose_i(),grid0_i(),grid1_i(),grid2_i(),grid3_i(),grid4_i(),grid5_i(),grid6_i(),grid7_i(),grid8_i(),grid9_i(),btnStart_i(),btnAward_i(),imgFlag_i()];
			
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
			temp.height = 651;
			temp.styleName = "ui/app/turntable/pan.png";
			temp.width = 688;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnAward_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAward = temp;
			temp.name = "btnAward";
			temp.height = 79;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.turntable.button.ButtonSkin_linjiang);
			temp.width = 79;
			temp.x = 422;
			temp.y = 334;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 37;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_big);
			temp.width = 41;
			temp.x = 554;
			temp.y = 162;
			return temp;
		}

		private function btnStart_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnStart = temp;
			temp.name = "btnStart";
			temp.height = 79;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.turntable.button.ButtonSkin_start);
			temp.width = 79;
			temp.x = 422;
			temp.y = 334;
			return temp;
		}

		private function grid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid0 = temp;
			temp.name = "grid0";
			temp.height = 55;
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.width = 54;
			temp.x = 438;
			temp.y = 204;
			return temp;
		}

		private function grid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid1 = temp;
			temp.name = "grid1";
			temp.height = 55;
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.width = 54;
			temp.x = 525;
			temp.y = 232;
			return temp;
		}

		private function grid2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid2 = temp;
			temp.name = "grid2";
			temp.height = 55;
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.width = 54;
			temp.x = 574;
			temp.y = 307;
			return temp;
		}

		private function grid3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid3 = temp;
			temp.name = "grid3";
			temp.height = 55;
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.width = 54;
			temp.x = 574;
			temp.y = 395;
			return temp;
		}

		private function grid4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid4 = temp;
			temp.name = "grid4";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 524;
			temp.y = 467;
			return temp;
		}

		private function grid5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid5 = temp;
			temp.name = "grid5";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 438;
			temp.y = 495;
			return temp;
		}

		private function grid6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid6 = temp;
			temp.name = "grid6";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 351;
			temp.y = 466;
			return temp;
		}

		private function grid7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid7 = temp;
			temp.name = "grid7";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 297;
			temp.y = 393;
			return temp;
		}

		private function grid8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid8 = temp;
			temp.name = "grid8";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 297;
			temp.y = 305;
			return temp;
		}

		private function grid9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid9 = temp;
			temp.name = "grid9";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 351;
			temp.y = 228;
			return temp;
		}

		private function imgFlag_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgFlag = temp;
			temp.name = "imgFlag";
			temp.height = 126;
			temp.pivotX = 65;
			temp.pivotY = 190;
			temp.rotation = 0;
			temp.styleName = "ui/app/turntable/zheng.png";
			temp.width = 130;
			temp.x = 463;
			temp.y = 373;
			return temp;
		}

	}
}