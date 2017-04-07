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

		public var lb_name:feathers.controls.Label;

		public var lb_num:feathers.controls.Label;

		public var lb_up:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Shuxing2_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 20;
			this.width = 90;
			this.elementsContent = [lb_name_i(),lb_num_i(),lb_up_i(),arrow_up_i()];
			
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
			temp.styleName = "ui/common/tubiao/tu_up.png";
			temp.x = 61;
			temp.y = 4;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.text = "力道：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lb_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_num = temp;
			temp.name = "lb_num";
			temp.text = "20";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 38;
			temp.y = 0;
			return temp;
		}

		private function lb_up_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_up = temp;
			temp.name = "lb_up";
			temp.text = "20";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 71;
			temp.y = 0;
			return temp;
		}

	}
}