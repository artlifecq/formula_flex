package org.mokylin.skin.app.toujing.item
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.layout.HorizontalLayout;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TouJingSettingSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var gridsGroup:feathers.controls.Group;

		public var labJingShu:feathers.controls.Label;

		public var skinableContainer:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TouJingSettingSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 130;
			this.width = 380;
			this.elementsContent = [labJingShu_i(),skinableContainer_i(),gridsGroup_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TouJingSettingSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 8;
			return temp;
		}

		private function gridsGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gridsGroup = temp;
			temp.name = "gridsGroup";
			temp.height = 55;
			temp.width = 346;
			temp.x = 30;
			temp.y = 65;
			temp.layout = __TouJingSettingSkin_HorizontalLayout1_i();
			return temp;
		}

		private function labJingShu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labJingShu = temp;
			temp.name = "labJingShu";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "查询各国经书数量";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 120;
			temp.x = 30;
			temp.y = 35;
			return temp;
		}

		private function skinableContainer_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinableContainer = temp;
			temp.name = "skinableContainer";
			temp.height = 30;
			temp.width = 237;
			temp.x = 10;
			temp.y = 5;
			return temp;
		}

	}
}