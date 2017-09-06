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
	public class NpcName2 extends feathers.controls.StateSkin
	{
		public var lbl_name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function NpcName2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 33;
			this.elementsContent = [__NpcName2_UIAsset1_i(),lbl_name_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __NpcName2_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/maps/hong.png";
			temp.x = 40;
			temp.y = 16;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.height = 16;
			temp.fontSize = 14;
			temp.text = "一二三四五";
			temp.textAlign = "center";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 97;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}