package org.mokylin.skin.app.maps
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ThansName extends feathers.controls.StateSkin
	{
		public var lbl_name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ThansName()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__ThansName_UIAsset1_i(),lbl_name_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ThansName_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/maps/lan.png";
			temp.x = 34;
			temp.y = 8;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.height = 17;
			temp.fontSize = 14;
			temp.text = "通往马贼营寨";
			temp.textAlign = "center";
			temp.color = 0x14C5FF;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 124;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}