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

		public var icon1:feathers.controls.UIAsset;

		public var jiangli_text:feathers.controls.UIAsset;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuBen_ZhenQi_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__FuBen_ZhenQi_Skin_UIAsset2_i(),__FuBen_ZhenQi_Skin_UIAsset3_i(),jiangli_text_i(),icon1_i(),list_i(),btnNext_i(),btnPrev_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuBen_ZhenQi_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/fuben/bbg.jpg";
			temp.x = 22;
			temp.y = 87;
			return temp;
		}

		private function __FuBen_ZhenQi_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/tiao.jpg";
			temp.x = 22;
			temp.y = 514;
			return temp;
		}

		private function btnNext_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnNext = temp;
			temp.name = "btnNext";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 905;
			temp.y = 281;
			return temp;
		}

		private function btnPrev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPrev = temp;
			temp.name = "btnPrev";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 57;
			temp.y = 281;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 879;
			temp.y = 528;
			return temp;
		}

		private function jiangli_text_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jiangli_text = temp;
			temp.name = "jiangli_text";
			temp.styleName = "ui/app/fuben/fubengjiangli.png";
			temp.x = 656;
			temp.y = 547;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 423;
			temp.width = 902;
			temp.x = 27;
			temp.y = 91;
			return temp;
		}

	}
}