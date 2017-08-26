package org.mokylin.skin.mainui.map
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.uinumber.UINumberChuansong;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TranpprtLevel extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var num:feathers.controls.UINumber;

		public var uiJi:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TranpprtLevel()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [num_i(),uiJi_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function num_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num = temp;
			temp.name = "num";
			temp.gap = -23;
			temp.height = 34;
			temp.label = "20";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberChuansong;
			temp.textAlign = "center";
			temp.width = 56;
			return temp;
		}

		private function uiJi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiJi = temp;
			temp.name = "uiJi";
			temp.height = 34;
			temp.styleName = "ui/art_txt/common/ji.png";
			temp.width = 34;
			temp.x = 46;
			temp.y = 0;
			return temp;
		}

	}
}