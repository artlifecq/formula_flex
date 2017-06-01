package org.mokylin.skin.app.zhanchang.jingjichang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JingJiPaiMing extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ListItem:feathers.controls.List;

		public var labTitle:feathers.controls.Label;

		public var uiDown:feathers.controls.UIAsset;

		public var uiUp:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JingJiPaiMing()
		{
			super();
			
			this.currentState = "normal";
			this.height = 24;
			this.width = 276;
			this.elementsContent = [__JingJiPaiMing_UIAsset1_i(),uiDown_i(),uiUp_i(),labTitle_i(),ListItem_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function ListItem_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			ListItem = temp;
			temp.name = "ListItem";
			temp.height = 188;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 276;
			temp.x = 0;
			temp.y = 25;
			return temp;
		}

		private function __JingJiPaiMing_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/app/zhanchang/jingjichang/kuang.png";
			temp.top = 0;
			return temp;
		}

		private function labTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTitle = temp;
			temp.name = "labTitle";
			temp.text = "您成功击败羽林校尉，排名升至1460";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 238;
			temp.x = 17;
			temp.y = 3;
			return temp;
		}

		private function uiDown_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiDown = temp;
			temp.name = "uiDown";
			temp.styleName = "ui/app/zhanchang/jingjichang/xia.png";
			temp.x = 258;
			temp.y = 9;
			return temp;
		}

		private function uiUp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiUp = temp;
			temp.name = "uiUp";
			temp.styleName = "ui/app/zhanchang/jingjichang/shang.png";
			temp.visible = false;
			temp.x = 258;
			temp.y = 9;
			return temp;
		}

	}
}