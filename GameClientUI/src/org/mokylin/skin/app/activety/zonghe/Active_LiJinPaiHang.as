package org.mokylin.skin.app.activety.zonghe
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Active_LiJinPaiHang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Active_LiJinPaiHang()
		{
			super();
			
			this.currentState = "normal";
			this.height = 498;
			this.width = 421;
			this.elementsContent = [bg_i(),__Active_LiJinPaiHang_UIAsset1_i(),title_i(),btnClose_i(),__Active_LiJinPaiHang_Group1_i(),__Active_LiJinPaiHang_Group2_i(),__Active_LiJinPaiHang_UIAsset9_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Active_LiJinPaiHang_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 11;
			temp.y = 41;
			temp.elementsContent = [__Active_LiJinPaiHang_UIAsset2_i(),__Active_LiJinPaiHang_UIAsset3_i(),__Active_LiJinPaiHang_UIAsset4_i(),__Active_LiJinPaiHang_UIAsset5_i(),__Active_LiJinPaiHang_UIAsset6_i()];
			return temp;
		}

		private function __Active_LiJinPaiHang_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 11;
			temp.y = 388;
			temp.elementsContent = [__Active_LiJinPaiHang_UIAsset7_i(),__Active_LiJinPaiHang_UIAsset8_i()];
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 441;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 405;
			temp.x = 8;
			temp.y = 38;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/zhanchangrizhibg.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/paiming.png";
			temp.x = 23;
			temp.y = 7;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/mingzi.png";
			temp.x = 103;
			temp.y = 7;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/banghui.png";
			temp.x = 219;
			temp.y = 7;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/bangdingyuanbao.png";
			temp.x = 316;
			temp.y = 7;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/zhanchangrizhibg.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/wodepaiming.png";
			temp.x = 171;
			temp.y = 7;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/henyihan.png";
			temp.x = 72;
			temp.y = 420;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 498;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 421;
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
			temp.x = 386;
			temp.y = 7;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.bold = true;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "礼金排行";
			temp.textAlign = "center";
			temp.color = 0xDDE2B1;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 240;
			temp.x = 90;
			temp.y = 11;
			return temp;
		}

	}
}