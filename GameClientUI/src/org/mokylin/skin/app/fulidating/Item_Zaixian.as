package org.mokylin.skin.app.fulidating
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
	public class Item_Zaixian extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnOK:feathers.controls.Button;

		public var icon:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Item_Zaixian()
		{
			super();
			
			this.currentState = "normal";
			this.height = 383;
			this.width = 184;
			this.elementsContent = [__Item_Zaixian_UIAsset1_i(),uiName_i(),icon_i(),__Item_Zaixian_Label1_i(),btnOK_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Item_Zaixian_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "绑定铜钱";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 62;
			temp.y = 248;
			return temp;
		}

		private function __Item_Zaixian_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fulidating/zxjlk.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnOK_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOK = temp;
			temp.name = "btnOK";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "抽 奖";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 110;
			temp.x = 40;
			temp.y = 315;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/app/fulidating/tubiaokuang.png";
			temp.x = 57;
			temp.y = 170;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/fulidating/word/5fen.png";
			temp.x = 47;
			temp.y = 52;
			return temp;
		}

	}
}