package org.mokylin.skin.app.shejiao.zudui
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
	public class Zudui_Head extends feathers.controls.StateSkin
	{
		public var lab_name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zudui_Head()
		{
			super();
			
			this.currentState = "normal";
			this.height = 25;
			this.width = 175;
			this.elementsContent = [__Zudui_Head_UIAsset1_i(),lab_name_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Zudui_Head_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/shejiao/zudui/mingzidi.png";
			temp.width = 175;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lab_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_name = temp;
			temp.name = "lab_name";
			temp.height = 17;
			temp.fontSize = 12;
			temp.text = "[3000区]玩家名六个字【999】";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 175;
			temp.x = -1;
			temp.y = 9;
			return temp;
		}

	}
}