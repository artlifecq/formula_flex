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
	public class RenWu_Tips1 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgBG:feathers.controls.UIAsset;

		public var ioc_1_0:feathers.controls.UIAsset;

		public var lbHead:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RenWu_Tips1()
		{
			super();
			
			this.currentState = "normal";
			this.height = 136;
			this.width = 231;
			this.elementsContent = [imgBG_i(),__RenWu_Tips1_UIAsset1_i(),lbHead_i(),__RenWu_Tips1_Label1_i(),ioc_1_0_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RenWu_Tips1_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "任务奖励：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 81;
			temp.y = 48;
			return temp;
		}

		private function __RenWu_Tips1_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/mingzibg.png";
			temp.x = 26;
			temp.y = 19;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 136;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 231;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function ioc_1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ioc_1_0 = temp;
			temp.name = "ioc_1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 91.5;
			temp.y = 73;
			return temp;
		}

		private function lbHead_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHead = temp;
			temp.name = "lbHead";
			temp.fontSize = 16;
			temp.text = "第4章 觉醒五个字";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 209;
			temp.x = 11;
			temp.y = 20;
			return temp;
		}

	}
}