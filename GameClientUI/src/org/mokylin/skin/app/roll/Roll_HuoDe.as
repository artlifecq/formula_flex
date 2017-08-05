package org.mokylin.skin.app.roll
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Roll_HuoDe extends feathers.controls.StateSkin
	{
		public var icon:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Roll_HuoDe()
		{
			super();
			
			this.currentState = "normal";
			this.height = 154;
			this.width = 425;
			this.elementsContent = [__Roll_HuoDe_UIAsset1_i(),__Roll_HuoDe_UIAsset2_i(),icon_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Roll_HuoDe_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/roll/zsd.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Roll_HuoDe_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/roll/gxnhdl.png";
			temp.x = 121;
			temp.y = 24;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 177;
			temp.y = 66;
			return temp;
		}

	}
}