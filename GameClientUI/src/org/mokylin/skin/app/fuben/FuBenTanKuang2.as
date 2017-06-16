package org.mokylin.skin.app.fuben
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FuBenTanKuang2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnOK:feathers.controls.Button;

		public var lbl_title:feathers.controls.Label;

		public var title:feathers.controls.Label;

		public var uiName:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuBenTanKuang2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 270;
			this.width = 332;
			this.elementsContent = [bg_i(),__FuBenTanKuang2_UIAsset1_i(),__FuBenTanKuang2_UIAsset2_i(),btnOK_i(),title_i(),uiName_i(),lbl_title_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuBenTanKuang2_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 161;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 310;
			temp.x = 11;
			temp.y = 41;
			return temp;
		}

		private function __FuBenTanKuang2_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/erji_bg.jpg";
			temp.x = 15;
			temp.y = 44;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 270;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 332;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnOK_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOK = temp;
			temp.name = "btnOK";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "确 定";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xE1D4A9;
			temp.width = 95;
			temp.x = 118.5;
			temp.y = 216;
			return temp;
		}

		private function lbl_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_title = temp;
			temp.name = "lbl_title";
			temp.bold = true;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "提 示";
			temp.textAlign = "center";
			temp.color = 0xDDE2B1;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 240;
			temp.x = 48;
			temp.y = 11;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.height = 55;
			temp.fontSize = 16;
			temp.text = "浪里小白还没有准备就绪";
			temp.textAlign = "center";
			temp.color = 0xC29444;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 257;
			temp.x = 40;
			temp.y = 108;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/fuben/duorenfuben/fuben_name/changpinjiucheng/normal.png";
			temp.x = 161;
			temp.y = 117;
			return temp;
		}

	}
}