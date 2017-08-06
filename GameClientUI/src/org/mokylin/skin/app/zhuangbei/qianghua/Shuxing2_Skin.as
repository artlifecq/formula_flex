package org.mokylin.skin.app.zhuangbei.qianghua
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
	public class Shuxing2_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var arrow_up:feathers.controls.UIAsset;

		public var lb_num:feathers.controls.Label;

		public var lb_up:feathers.controls.Label;

		public var ui_name:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Shuxing2_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 20;
			this.width = 120;
			this.elementsContent = [lb_num_i(),lb_up_i(),arrow_up_i(),ui_name_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function arrow_up_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrow_up = temp;
			temp.name = "arrow_up";
			temp.styleName = "ui/common/tubiao/jobup2.png";
			temp.x = 85;
			temp.y = 2;
			return temp;
		}

		private function lb_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_num = temp;
			temp.name = "lb_num";
			temp.text = "1000";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 45;
			temp.y = 0;
			return temp;
		}

		private function lb_up_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_up = temp;
			temp.name = "lb_up";
			temp.text = "20";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 100;
			temp.y = 0;
			return temp;
		}

		private function ui_name_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_name = temp;
			temp.name = "ui_name";
			temp.styleName = "ui/common/shuxing/ld.png";
			temp.x = 0;
			temp.y = -1;
			return temp;
		}

	}
}