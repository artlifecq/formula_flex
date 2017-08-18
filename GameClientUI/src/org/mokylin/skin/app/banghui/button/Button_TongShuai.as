package org.mokylin.skin.app.banghui.button
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Button_TongShuai extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __Button_TongShuai_UIAsset1:feathers.controls.UIAsset;

		public var __Button_TongShuai_UIAsset2:feathers.controls.UIAsset;

		public var __Button_TongShuai_UIAsset3:feathers.controls.UIAsset;

		public var __Button_TongShuai_UIAsset4:feathers.controls.UIAsset;

		public var __Button_TongShuai_UIAsset5:feathers.controls.UIAsset;

		public var __Button_TongShuai_UIAsset6:feathers.controls.UIAsset;

		public var __Button_TongShuai_UIAsset7:feathers.controls.UIAsset;

		public var __Button_TongShuai_UIAsset8:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Button_TongShuai()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.height = 42;
			this.width = 123;
			this.elementsContent = [];
			__Button_TongShuai_UIAsset1_i();
			__Button_TongShuai_UIAsset2_i();
			__Button_TongShuai_UIAsset3_i();
			__Button_TongShuai_UIAsset4_i();
			__Button_TongShuai_UIAsset5_i();
			__Button_TongShuai_UIAsset6_i();
			__Button_TongShuai_UIAsset7_i();
			__Button_TongShuai_UIAsset8_i();
			
			
			states = {
				hover:[
						{target:"__Button_TongShuai_UIAsset2",
							name:"y",
							value:0
						}
						,
						{target:"__Button_TongShuai_UIAsset2",
							name:"x",
							value:0
						}
						,
						{target:"__Button_TongShuai_UIAsset6",
							name:"x",
							value:31.5
						}
						,
						{target:"__Button_TongShuai_UIAsset6",
							name:"y",
							value:12.5
						}
					]
				,
				down:[
						{target:"__Button_TongShuai_UIAsset3",
							name:"x",
							value:0
						}
						,
						{target:"__Button_TongShuai_UIAsset3",
							name:"y",
							value:0
						}
						,
						{target:"__Button_TongShuai_UIAsset7",
							name:"x",
							value:31.5
						}
						,
						{target:"__Button_TongShuai_UIAsset7",
							name:"y",
							value:12.5
						}
					]
				,
				hhoverAndSelected:[
						{target:"__Button_TongShuai_UIAsset2",
							name:"x",
							value:0
						}
						,
						{target:"__Button_TongShuai_UIAsset2",
							name:"y",
							value:0
						}
						,
						{target:"__Button_TongShuai_UIAsset6",
							name:"x",
							value:31.5
						}
						,
						{target:"__Button_TongShuai_UIAsset6",
							name:"y",
							value:12.5
						}
					]
				,
				downAndSelected:[
						{target:"__Button_TongShuai_UIAsset3",
							name:"x",
							value:0
						}
						,
						{target:"__Button_TongShuai_UIAsset3",
							name:"y",
							value:0
						}
						,
						{target:"__Button_TongShuai_UIAsset7",
							name:"x",
							value:31.5
						}
						,
						{target:"__Button_TongShuai_UIAsset7",
							name:"y",
							value:12.5
						}
					]
			};
			skinNames={"down":"ui/app/banghui/button/yeqian/down.png,ui/app/banghui/button/jineng2/down.png",
			"downAndSelected":"ui/app/banghui/button/yeqian/down.png,ui/app/banghui/button/jineng2/down.png",
			"hover":"ui/app/banghui/button/yeqian/over.png,ui/app/banghui/button/jineng2/over.png",
			"hoverAndSelected":"ui/app/banghui/button/yeqian/over.png,ui/app/banghui/button/jineng2/over.png",
			"up":"ui/app/banghui/button/yeqian/up.png,ui/app/banghui/button/jineng2/up.png",
			"upAndSelected":"ui/app/banghui/button/yeqian/over.png,ui/app/banghui/button/jineng2/over.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Button_TongShuai_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__Button_TongShuai_UIAsset1 = temp;
			temp.height = 42;
			temp.styleName = "ui/app/banghui/button/yeqian/up.png";
			temp.width = 123;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Button_TongShuai_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__Button_TongShuai_UIAsset2 = temp;
			temp.height = 42;
			temp.styleName = "ui/app/banghui/button/yeqian/over.png";
			temp.width = 123;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Button_TongShuai_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__Button_TongShuai_UIAsset3 = temp;
			temp.height = 42;
			temp.styleName = "ui/app/banghui/button/yeqian/down.png";
			temp.width = 123;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Button_TongShuai_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__Button_TongShuai_UIAsset4 = temp;
			temp.height = 42;
			temp.styleName = "ui/app/banghui/button/yeqian/over.png";
			temp.width = 123;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Button_TongShuai_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__Button_TongShuai_UIAsset5 = temp;
			temp.height = 16;
			temp.styleName = "ui/app/banghui/button/jineng2/up.png";
			temp.width = 60;
			temp.x = 31.5;
			temp.y = 12.5;
			return temp;
		}

		private function __Button_TongShuai_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__Button_TongShuai_UIAsset6 = temp;
			temp.height = 16;
			temp.styleName = "ui/app/banghui/button/jineng2/over.png";
			temp.width = 60;
			temp.x = 35;
			temp.y = 10;
			return temp;
		}

		private function __Button_TongShuai_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__Button_TongShuai_UIAsset7 = temp;
			temp.height = 16;
			temp.styleName = "ui/app/banghui/button/jineng2/down.png";
			temp.width = 60;
			temp.x = 35;
			temp.y = 10;
			return temp;
		}

		private function __Button_TongShuai_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__Button_TongShuai_UIAsset8 = temp;
			temp.height = 16;
			temp.styleName = "ui/app/banghui/button/jineng2/over.png";
			temp.width = 60;
			temp.x = 31.5;
			temp.y = 12.5;
			return temp;
		}

	}
}