package org.mokylin.skin.app.tequan
{
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.tequan.TQ_Youxilipai;
	import org.mokylin.skin.app.tequan.button.ButtonLingqu;
	import org.mokylin.skin.common.TongYongPanelbg1;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tequan_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnOk:feathers.controls.Button;

		public var listCont:feathers.controls.List;

		public var skinCont:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tequan_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__Tequan_Skin_UIAsset1_i(),__Tequan_Skin_UIAsset2_i(),skinCont_i(),btnOk_i(),__Tequan_Skin_UIAsset3_i(),listCont_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tequan_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __Tequan_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 504;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 712;
			temp.x = 224;
			temp.y = 86;
			return temp;
		}

		private function __Tequan_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/tequan/37huodong.png";
			temp.x = 436;
			temp.y = 19;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 601;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongPanelbg1()
			temp.skin = skin
			temp.width = 956;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.styleClass = org.mokylin.skin.app.tequan.button.ButtonLingqu;
			temp.x = 555;
			temp.y = 499;
			return temp;
		}

		private function listCont_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listCont = temp;
			temp.name = "listCont";
			temp.height = 500;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 207;
			temp.x = 23;
			temp.y = 89;
			return temp;
		}

		private function skinCont_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinCont = temp;
			temp.name = "skinCont";
			temp.height = 498;
			var skin:StateSkin = new org.mokylin.skin.app.tequan.TQ_Youxilipai()
			temp.skin = skin
			temp.width = 706;
			temp.x = 227;
			temp.y = 89;
			return temp;
		}

	}
}