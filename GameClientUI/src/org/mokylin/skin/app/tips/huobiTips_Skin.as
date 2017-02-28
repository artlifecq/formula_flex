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
	public class huobiTips_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbl_huobi:feathers.controls.Label;

		public var lbl_laiyuan:feathers.controls.Label;

		public var lbl_miaoshu:feathers.controls.Label;

		public var lbl_name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function huobiTips_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__huobiTips_Skin_UIAsset1_i(),lbl_name_i(),lbl_huobi_i(),lbl_miaoshu_i(),lbl_laiyuan_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __huobiTips_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 85;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 295;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbl_huobi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_huobi = temp;
			temp.name = "lbl_huobi";
			temp.bold = false;
			temp.height = 19;
			temp.fontSize = 14;
			temp.text = "99999/100000";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 214;
			temp.x = 71;
			temp.y = 8;
			return temp;
		}

		private function lbl_laiyuan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_laiyuan = temp;
			temp.name = "lbl_laiyuan";
			temp.height = 20;
			temp.text = "通过参与活动等方式可获得银两";
			temp.color = 0x2083B9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 235;
			temp.x = 11;
			temp.y = 57;
			return temp;
		}

		private function lbl_miaoshu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_miaoshu = temp;
			temp.name = "lbl_miaoshu";
			temp.height = 20;
			temp.text = "货币可用于玩家间交易及购买商店道具";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 235;
			temp.x = 11;
			temp.y = 33;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.bold = false;
			temp.height = 19;
			temp.fontSize = 14;
			temp.text = "货币：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 52;
			temp.x = 11;
			temp.y = 8;
			return temp;
		}

	}
}