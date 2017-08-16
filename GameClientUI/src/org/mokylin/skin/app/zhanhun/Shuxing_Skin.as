package org.mokylin.skin.app.zhanhun
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Shuxing_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var arrow_up:feathers.controls.UIAsset;

		public var grp_up:feathers.controls.Group;

		public var lb_Num:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Shuxing_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 20;
			this.elementsContent = [lb_name_i(),grp_up_i()];
			
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
			temp.styleName = "ui/common/tubiao/jobup.png";
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function grp_up_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_up = temp;
			temp.name = "grp_up";
			temp.x = 40;
			temp.y = 0;
			temp.elementsContent = [arrow_up_i(),lb_Num_i()];
			return temp;
		}

		private function lb_Num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_Num = temp;
			temp.name = "lb_Num";
			temp.text = "20";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 53;
			temp.x = 12;
			temp.y = 1;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.text = "32157";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 81;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

	}
}