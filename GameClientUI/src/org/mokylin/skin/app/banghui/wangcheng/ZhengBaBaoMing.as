package org.mokylin.skin.app.banghui.wangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ZhengBaBaoMing extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var List:feathers.controls.List;

		public var bg:feathers.controls.UIAsset;

		public var btnClose1:feathers.controls.Button;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZhengBaBaoMing()
		{
			super();
			
			this.currentState = "normal";
			this.height = 429;
			this.width = 625;
			this.elementsContent = [bg_i(),__ZhengBaBaoMing_UIAsset1_i(),title_i(),btnClose1_i(),__ZhengBaBaoMing_Group1_i(),List_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function List_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			List = temp;
			temp.name = "List";
			temp.height = 349;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 601;
			temp.x = 12;
			temp.y = 67;
			return temp;
		}

		private function __ZhengBaBaoMing_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 12;
			temp.y = 41;
			temp.elementsContent = [__ZhengBaBaoMing_UIAsset2_i(),__ZhengBaBaoMing_Label1_i(),__ZhengBaBaoMing_Label2_i(),__ZhengBaBaoMing_Label3_i(),__ZhengBaBaoMing_Label4_i(),__ZhengBaBaoMing_Label5_i(),__ZhengBaBaoMing_Label6_i()];
			return temp;
		}

		private function __ZhengBaBaoMing_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "城市名称";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 4;
			temp.y = 4;
			return temp;
		}

		private function __ZhengBaBaoMing_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "占领帮派";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 95;
			temp.y = 4;
			return temp;
		}

		private function __ZhengBaBaoMing_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "当前出价最高帮派";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 188;
			temp.y = 4;
			return temp;
		}

		private function __ZhengBaBaoMing_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "当前最高出价";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 313;
			temp.y = 4;
			return temp;
		}

		private function __ZhengBaBaoMing_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "竞拍结束倒计时";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 414;
			temp.y = 4;
			return temp;
		}

		private function __ZhengBaBaoMing_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "操作";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 545;
			temp.y = 4;
			return temp;
		}

		private function __ZhengBaBaoMing_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 381;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 606;
			temp.x = 9;
			temp.y = 40;
			return temp;
		}

		private function __ZhengBaBaoMing_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/yeqian2.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 429;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 625;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose1 = temp;
			temp.name = "btnClose1";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 591;
			temp.y = 7;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.bold = true;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "争霸报名";
			temp.textAlign = "center";
			temp.color = 0xDDE2B1;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 240;
			temp.x = 192.5;
			temp.y = 11;
			return temp;
		}

	}
}