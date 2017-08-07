package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RenWu_Tips2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grpfoot:feathers.controls.Group;

		public var imgBG:feathers.controls.UIAsset;

		public var ioc_1_0:feathers.controls.UIAsset;

		public var item_list:feathers.controls.Group;

		public var lbHead:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RenWu_Tips2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 501;
			this.width = 231;
			this.elementsContent = [imgBG_i(),__RenWu_Tips2_UIAsset1_i(),lbHead_i(),__RenWu_Tips2_Label1_i(),ioc_1_0_i(),grpfoot_i(),item_list_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RenWu_Tips2_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "任务奖励：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 12;
			temp.y = 50;
			return temp;
		}

		private function __RenWu_Tips2_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/mingzibg.png";
			temp.x = 26;
			temp.y = 19;
			return temp;
		}

		private function __RenWu_Tips2_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/xian.png";
			temp.width = 221;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grpfoot_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpfoot = temp;
			temp.name = "grpfoot";
			temp.x = 4;
			temp.y = 465;
			temp.elementsContent = [__RenWu_Tips2_UIAsset2_i(),lbTime_i()];
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 501;
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
			temp.x = 18;
			temp.y = 73;
			return temp;
		}

		private function item_list_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			item_list = temp;
			temp.name = "item_list";
			temp.x = 4;
			temp.y = 125;
			temp.elementsContent = [];
			return temp;
		}

		private function lbHead_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHead = temp;
			temp.name = "lbHead";
			temp.fontSize = 16;
			temp.text = "环式任务";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 209;
			temp.x = 11;
			temp.y = 20;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "每日24点重置，任务回到第一环";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 210;
			temp.x = 8;
			temp.y = 8;
			return temp;
		}

	}
}