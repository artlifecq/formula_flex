package org.mokylin.skin.app.paihangbang.button
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonZhanliPaiHang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __ButtonZhanliPaiHang_UIAsset1:feathers.controls.UIAsset;

		public var __ButtonZhanliPaiHang_UIAsset2:feathers.controls.UIAsset;

		public var __ButtonZhanliPaiHang_UIAsset3:feathers.controls.UIAsset;

		public var __ButtonZhanliPaiHang_UIAsset4:feathers.controls.UIAsset;

		public var __ButtonZhanliPaiHang_UIAsset5:feathers.controls.UIAsset;

		public var __ButtonZhanliPaiHang_UIAsset6:feathers.controls.UIAsset;

		public var __ButtonZhanliPaiHang_UIAsset7:feathers.controls.UIAsset;

		public var __ButtonZhanliPaiHang_UIAsset8:feathers.controls.UIAsset;

		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonZhanliPaiHang()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.elementsContent = [labelDisplay_i(),iconDisplay_i()];
			__ButtonZhanliPaiHang_UIAsset1_i();
			__ButtonZhanliPaiHang_UIAsset2_i();
			__ButtonZhanliPaiHang_UIAsset3_i();
			__ButtonZhanliPaiHang_UIAsset4_i();
			__ButtonZhanliPaiHang_UIAsset5_i();
			__ButtonZhanliPaiHang_UIAsset6_i();
			__ButtonZhanliPaiHang_UIAsset7_i();
			__ButtonZhanliPaiHang_UIAsset8_i();
			
			
			states = {
				hover:[
						{target:"__ButtonZhanliPaiHang_UIAsset6",
							name:"x",
							value:45
						}
						,
						{target:"__ButtonZhanliPaiHang_UIAsset6",
							name:"y",
							value:12
						}
					]
				,
				down:[
						{target:"__ButtonZhanliPaiHang_UIAsset7",
							name:"x",
							value:45
						}
						,
						{target:"__ButtonZhanliPaiHang_UIAsset7",
							name:"y",
							value:12
						}
					]
				,
				hhoverAndSelected:[
						{target:"__ButtonZhanliPaiHang_UIAsset6",
							name:"x",
							value:45
						}
						,
						{target:"__ButtonZhanliPaiHang_UIAsset6",
							name:"y",
							value:12
						}
					]
				,
				downAndSelected:[
						{target:"__ButtonZhanliPaiHang_UIAsset7",
							name:"x",
							value:45
						}
						,
						{target:"__ButtonZhanliPaiHang_UIAsset7",
							name:"y",
							value:12
						}
					]
			};
			skinNames={"down":"ui/app/paihangbang/button/btnBase/down.png,ui/app/paihangbang/button/zhanlipaihang/down.png",
			"downAndSelected":"ui/app/paihangbang/button/btnBase/down.png,ui/app/paihangbang/button/zhanlipaihang/down.png",
			"hover":"ui/app/paihangbang/button/btnBase/over.png,ui/app/paihangbang/button/zhanlipaihang/over.png",
			"hoverAndSelected":"ui/app/paihangbang/button/btnBase/over.png,ui/app/paihangbang/button/zhanlipaihang/over.png",
			"up":"ui/app/paihangbang/button/btnBase/up.png,ui/app/paihangbang/button/zhanlipaihang/up.png",
			"upAndSelected":"ui/app/paihangbang/button/btnBase/over.png,ui/app/paihangbang/button/zhanlipaihang/over.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ButtonZhanliPaiHang_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonZhanliPaiHang_UIAsset1 = temp;
			temp.styleName = "ui/app/paihangbang/button/btnBase/up.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ButtonZhanliPaiHang_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonZhanliPaiHang_UIAsset2 = temp;
			temp.styleName = "ui/app/paihangbang/button/btnBase/over.png";
			return temp;
		}

		private function __ButtonZhanliPaiHang_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonZhanliPaiHang_UIAsset3 = temp;
			temp.styleName = "ui/app/paihangbang/button/btnBase/down.png";
			return temp;
		}

		private function __ButtonZhanliPaiHang_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonZhanliPaiHang_UIAsset4 = temp;
			temp.styleName = "ui/app/paihangbang/button/btnBase/over.png";
			return temp;
		}

		private function __ButtonZhanliPaiHang_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonZhanliPaiHang_UIAsset5 = temp;
			temp.styleName = "ui/app/paihangbang/button/zhanlipaihang/up.png";
			temp.x = 45;
			temp.y = 12;
			return temp;
		}

		private function __ButtonZhanliPaiHang_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonZhanliPaiHang_UIAsset6 = temp;
			temp.styleName = "ui/app/paihangbang/button/zhanlipaihang/over.png";
			return temp;
		}

		private function __ButtonZhanliPaiHang_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonZhanliPaiHang_UIAsset7 = temp;
			temp.styleName = "ui/app/paihangbang/button/zhanlipaihang/down.png";
			return temp;
		}

		private function __ButtonZhanliPaiHang_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ButtonZhanliPaiHang_UIAsset8 = temp;
			temp.styleName = "ui/app/paihangbang/button/zhanlipaihang/over.png";
			temp.x = 45;
			temp.y = 12;
			return temp;
		}

		private function iconDisplay_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconDisplay = temp;
			temp.name = "iconDisplay";
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.text = "";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}