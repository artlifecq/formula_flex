package org.mokylin.skin.app.fuben
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FuBen_JingYan_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnEnter:feathers.controls.Button;

		public var ico_1:feathers.controls.UIAsset;

		public var ico_2:feathers.controls.UIAsset;

		public var ico_3:feathers.controls.UIAsset;

		public var ico_4:feathers.controls.UIAsset;

		public var ico_5:feathers.controls.UIAsset;

		public var ico_6:feathers.controls.UIAsset;

		public var lbGoumai:feathers.controls.Label;

		public var lbShengyu:feathers.controls.Label;

		public var lbTips:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuBen_JingYan_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [__FuBen_JingYan_Skin_UIAsset1_i(),__FuBen_JingYan_Skin_UIAsset2_i(),__FuBen_JingYan_Skin_UIAsset3_i(),ico_1_i(),ico_2_i(),ico_3_i(),ico_4_i(),ico_5_i(),ico_6_i(),lbTips_i(),lbShengyu_i(),lbGoumai_i(),btnEnter_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuBen_JingYan_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 14;
			temp.y = 69;
			return temp;
		}

		private function __FuBen_JingYan_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/fuben/bg.jpg";
			temp.x = 18;
			temp.y = 74;
			return temp;
		}

		private function __FuBen_JingYan_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/shoutongjiangli.png";
			temp.x = 388;
			temp.y = 483;
			return temp;
		}

		private function btnEnter_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnEnter = temp;
			temp.name = "btnEnter";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "挑 战";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xCFC6AE;
			temp.width = 79;
			temp.x = 813;
			temp.y = 513;
			return temp;
		}

		private function ico_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_1 = temp;
			temp.name = "ico_1";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/48.png";
			temp.x = 293;
			temp.y = 507;
			return temp;
		}

		private function ico_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_2 = temp;
			temp.name = "ico_2";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/48.png";
			temp.x = 354;
			temp.y = 507;
			return temp;
		}

		private function ico_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_3 = temp;
			temp.name = "ico_3";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/48.png";
			temp.x = 415;
			temp.y = 507;
			return temp;
		}

		private function ico_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_4 = temp;
			temp.name = "ico_4";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/48.png";
			temp.x = 475;
			temp.y = 507;
			return temp;
		}

		private function ico_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_5 = temp;
			temp.name = "ico_5";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/48.png";
			temp.x = 536;
			temp.y = 507;
			return temp;
		}

		private function ico_6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_6 = temp;
			temp.name = "ico_6";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/48.png";
			temp.x = 597;
			temp.y = 507;
			return temp;
		}

		private function lbGoumai_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbGoumai = temp;
			temp.name = "lbGoumai";
			temp.text = "剩余购买次数：99";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 130;
			temp.x = 29;
			temp.y = 530;
			return temp;
		}

		private function lbShengyu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbShengyu = temp;
			temp.name = "lbShengyu";
			temp.text = "今日剩余次数：99";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 130;
			temp.x = 29;
			temp.y = 499;
			return temp;
		}

		private function lbTips_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTips = temp;
			temp.name = "lbTips";
			temp.height = 86;
			temp.text = "副本提示：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 889;
			temp.x = 29;
			temp.y = 374;
			return temp;
		}

	}
}