package org.mokylin.skin.app.meiren
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.meiren.button.ButtonMeirenQiehuan;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MeiRen_Main extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnSelect:feathers.controls.Button;

		public var icon:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MeiRen_Main()
		{
			super();
			
			this.currentState = "normal";
			this.height = 99;
			this.width = 90;
			this.elementsContent = [bg_i(),uiName_i(),icon_i(),btnSelect_i()];
			
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
			temp.styleName = "ui/mainui/meirenHead/touxiangkuang.png";
			temp.x = 0;
			temp.y = 15;
			return temp;
		}

		private function btnSelect_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSelect = temp;
			temp.name = "btnSelect";
			temp.styleClass = org.mokylin.skin.app.meiren.button.ButtonMeirenQiehuan;
			temp.x = 2;
			temp.y = 51;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/pet/petHead/head2.png";
			temp.x = 25;
			temp.y = 5;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/pet/petName/name2s.png";
			temp.x = 23;
			temp.y = 73;
			return temp;
		}

	}
}