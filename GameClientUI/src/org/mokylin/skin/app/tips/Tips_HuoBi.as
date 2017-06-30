package org.mokylin.skin.app.tips
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
	public class Tips_HuoBi extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgBG:feathers.controls.UIAsset;

		public var lbl_miaoshu:feathers.controls.Label;

		public var lbl_name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_HuoBi()
		{
			super();
			
			this.currentState = "normal";
			this.height = 58;
			this.width = 280;
			this.elementsContent = [imgBG_i(),lbl_name_i(),lbl_miaoshu_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.top = 0;
			return temp;
		}

		private function lbl_miaoshu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_miaoshu = temp;
			temp.name = "lbl_miaoshu";
			temp.height = 18;
			temp.text = "货币可用于玩家交易及购买商店道具";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 229;
			temp.x = 10;
			temp.y = 30;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.bold = false;
			temp.height = 19;
			temp.htmlText = "<font color='#ffdd22'>货币：</font><font color='#00ff33'>9999/100000</font>";
			temp.fontSize = 14;
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 247;
			temp.x = 10;
			temp.y = 10;
			return temp;
		}

	}
}