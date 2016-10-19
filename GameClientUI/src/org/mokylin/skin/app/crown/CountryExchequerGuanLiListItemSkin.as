package org.mokylin.skin.app.crown
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryExchequerGuanLiListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var expensesReceipts:feathers.controls.Label;

		public var itemBg:feathers.controls.UIAsset;

		public var itemSelected:feathers.controls.UIAsset;

		public var things:feathers.controls.Label;

		public var time:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryExchequerGuanLiListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 32;
			this.width = 650;
			this.elementsContent = [itemBg_i(),itemSelected_i(),time_i(),things_i(),expensesReceipts_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function expensesReceipts_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			expensesReceipts = temp;
			temp.name = "expensesReceipts";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "15锭25两30文";
			temp.textAlign = "center";
			temp.color = 0x0064FF;
			temp.width = 180;
			temp.x = 430;
			temp.y = 4;
			return temp;
		}

		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
			temp.height = 32;
			temp.styleName = "ui/app/crown/lieditiao_xiao.png";
			temp.width = 650;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function itemSelected_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemSelected = temp;
			temp.name = "itemSelected";
			temp.height = 32;
			temp.styleName = "ui/common/liebiao/select.png";
			temp.width = 650;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function things_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			things = temp;
			temp.name = "things";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "军费补贴";
			temp.textAlign = "center";
			temp.color = 0x5B2812;
			temp.width = 140;
			temp.x = 204;
			temp.y = 4;
			return temp;
		}

		private function time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			time = temp;
			temp.name = "time";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "2015-12-21";
			temp.textAlign = "center";
			temp.color = 0x0A8015;
			temp.width = 140;
			temp.x = 17;
			temp.y = 4;
			return temp;
		}

	}
}