package org.mokylin.skin.app.roll
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Roll_DaojuDi extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var uiBg:feathers.controls.UIAsset;

		public var uiLock:feathers.controls.UIAsset;

		public var uiSelect:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Roll_DaojuDi()
		{
			super();
			
			this.currentState = "normal";
			this.height = 21;
			this.width = 101;
			this.elementsContent = [uiBg_i(),uiSelect_i(),uiLock_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function uiBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBg = temp;
			temp.name = "uiBg";
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/app/roll/diaoluomingzidi.png";
			temp.y = 0;
			return temp;
		}

		private function uiLock_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLock = temp;
			temp.name = "uiLock";
			temp.right = 1;
			temp.styleName = "ui/app/roll/jz.png";
			temp.y = 4;
			return temp;
		}

		private function uiSelect_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiSelect = temp;
			temp.name = "uiSelect";
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/app/roll/diaoluomingzidi_liang.png";
			temp.y = 0;
			return temp;
		}

	}
}