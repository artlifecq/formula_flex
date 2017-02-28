package org.mokylin.skin.common.tips
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class qianTips_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var qian_des:feathers.controls.Label;

		public var qian_get:feathers.controls.Label;

		public var qian_name:feathers.controls.Label;

		public var qian_num:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function qianTips_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 100;
			this.width = 280;
			this.elementsContent = [__qianTips_Skin_UIAsset1_i(),qian_name_i(),qian_num_i(),qian_des_i(),qian_get_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __qianTips_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 100;
			temp.styleName = "ui/common/tips/tips_zhuangbei_bg.png";
			temp.width = 280;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function qian_des_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			qian_des = temp;
			temp.name = "qian_des";
			temp.text = "礼金可用于礼金商城购买,无法用于交易";
			temp.width = 262;
			temp.x = 10;
			temp.y = 43;
			return temp;
		}

		private function qian_get_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			qian_get = temp;
			temp.name = "qian_get";
			temp.text = "标签";
			temp.color = 0x2c87b0;
			temp.width = 259;
			temp.x = 10;
			temp.y = 70;
			return temp;
		}

		private function qian_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			qian_name = temp;
			temp.name = "qian_name";
			temp.bold = true;
			temp.text = "标签:";
			temp.color = 0xe8c958;
			temp.x = 10;
			temp.y = 16;
			return temp;
		}

		private function qian_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			qian_num = temp;
			temp.name = "qian_num";
			temp.text = "标签";
			temp.x = 52;
			temp.y = 16;
			return temp;
		}

	}
}