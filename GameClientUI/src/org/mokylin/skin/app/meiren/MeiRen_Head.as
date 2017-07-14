package org.mokylin.skin.app.meiren
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MeiRen_Head extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var icon:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;

		public var uiNormal:feathers.controls.UIAsset;

		public var uiSelect:feathers.controls.UIAsset;

		public var uiZhan:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MeiRen_Head()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [uiNormal_i(),uiSelect_i(),uiName_i(),icon_i(),uiZhan_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/app/meiren/head_icon/head2s.png";
			temp.x = 25;
			temp.y = 0;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/meiren/head_icon/name2s.png";
			temp.x = 20;
			temp.y = 69;
			return temp;
		}

		private function uiNormal_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiNormal = temp;
			temp.name = "uiNormal";
			temp.styleName = "ui/app/meiren/button/meirenSelect/up.png";
			temp.x = 0;
			temp.y = 14;
			return temp;
		}

		private function uiSelect_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiSelect = temp;
			temp.name = "uiSelect";
			temp.styleName = "ui/app/meiren/button/meirenSelect/select.png";
			temp.x = 0;
			temp.y = 14;
			return temp;
		}

		private function uiZhan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiZhan = temp;
			temp.name = "uiZhan";
			temp.styleName = "ui/app/meiren/chuzhan.png";
			temp.x = 81;
			temp.y = 2;
			return temp;
		}

	}
}