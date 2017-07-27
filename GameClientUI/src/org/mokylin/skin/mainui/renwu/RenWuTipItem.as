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
	public class RenWuTipItem extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ioc_1:feathers.controls.UIAsset;

		public var lbName:feathers.controls.Label;

		public var uiOk:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RenWuTipItem()
		{
			super();
			
			this.currentState = "normal";
			this.height = 81;
			this.width = 221;
			this.elementsContent = [__RenWuTipItem_UIAsset1_i(),lbName_i(),ioc_1_i(),uiOk_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RenWuTipItem_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/xian.png";
			temp.width = 221;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function ioc_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ioc_1 = temp;
			temp.name = "ioc_1";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 10;
			temp.y = 33;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "今日完成5环任务奖励";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 207;
			temp.x = 8;
			temp.y = 8;
			return temp;
		}

		private function uiOk_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiOk = temp;
			temp.name = "uiOk";
			temp.styleName = "ui/common/yiwancheng.png";
			temp.x = 165;
			temp.y = 39;
			return temp;
		}

	}
}