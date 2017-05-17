package org.mokylin.skin.app.fuben
{
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_jiantou;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FuBen_ZhenQi_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnNext:feathers.controls.Button;

		public var btnPrev:feathers.controls.Button;

		public var ico_1:feathers.controls.UIAsset;

		public var ico_2:feathers.controls.UIAsset;

		public var ico_3:feathers.controls.UIAsset;

		public var ico_4:feathers.controls.UIAsset;

		public var ico_5:feathers.controls.UIAsset;

		public var ico_6:feathers.controls.UIAsset;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuBen_ZhenQi_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [__FuBen_ZhenQi_Skin_UIAsset1_i(),__FuBen_ZhenQi_Skin_UIAsset2_i(),btnNext_i(),btnPrev_i(),__FuBen_ZhenQi_Skin_UIAsset3_i(),ico_1_i(),ico_2_i(),ico_3_i(),ico_4_i(),ico_5_i(),ico_6_i(),list_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuBen_ZhenQi_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 14;
			temp.y = 69;
			return temp;
		}

		private function __FuBen_ZhenQi_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/fuben/bbg.jpg";
			temp.x = 18;
			temp.y = 74;
			return temp;
		}

		private function __FuBen_ZhenQi_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/fubengjiangli.png";
			temp.x = 388;
			temp.y = 483;
			return temp;
		}

		private function btnNext_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnNext = temp;
			temp.name = "btnNext";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 901;
			temp.y = 238;
			return temp;
		}

		private function btnPrev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPrev = temp;
			temp.name = "btnPrev";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 53;
			temp.y = 238;
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

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 387;
			temp.width = 827;
			temp.x = 60;
			temp.y = 80;
			return temp;
		}

	}
}