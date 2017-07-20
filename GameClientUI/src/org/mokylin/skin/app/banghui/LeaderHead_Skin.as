package org.mokylin.skin.app.banghui
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
	public class LeaderHead_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var headImg:feathers.controls.UIAsset;

		public var icon1:feathers.controls.UIAsset;

		public var lbName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function LeaderHead_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [lbName_i(),icon1_i(),headImg_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function headImg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			headImg = temp;
			temp.name = "headImg";
			temp.styleName = "ui/mainui/head/touxiang/bingjia/middle.png";
			temp.x = 23;
			temp.y = 8;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/quan2.png";
			temp.x = 17;
			temp.y = 1;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.leading = 4;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "玩家名字六子";
			temp.textAlign = "center";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.verticalAlign = "middle";
			temp.width = 106;
			temp.x = 1;
			temp.y = 82;
			return temp;
		}

	}
}