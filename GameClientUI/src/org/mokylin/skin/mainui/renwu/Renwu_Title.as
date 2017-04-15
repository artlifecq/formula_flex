package org.mokylin.skin.mainui.renwu
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
	public class Renwu_Title extends feathers.controls.StateSkin
	{
		public var labelDispaly:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Renwu_Title()
		{
			super();
			
			this.currentState = "normal";
			this.height = 25;
			this.width = 255;
			this.elementsContent = [__Renwu_Title_UIAsset1_i(),labelDispaly_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Renwu_Title_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/tiao2.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labelDispaly_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDispaly = temp;
			temp.name = "labelDispaly";
			temp.text = "任务奖励：";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 252;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

	}
}