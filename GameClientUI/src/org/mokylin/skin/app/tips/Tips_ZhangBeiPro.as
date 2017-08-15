package org.mokylin.skin.app.tips
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.progress.progress_jindutiao4;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tips_ZhangBeiPro extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbBar:feathers.controls.Label;

		public var skinBar:feathers.controls.ProgressBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_ZhangBeiPro()
		{
			super();
			
			this.currentState = "normal";
			this.height = 15;
			this.width = 173;
			this.elementsContent = [__Tips_ZhangBeiPro_UIAsset1_i(),skinBar_i(),lbBar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tips_ZhangBeiPro_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/progress/jindutiao4/jut_di.png";
			temp.width = 173;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbBar_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBar = temp;
			temp.name = "lbBar";
			temp.fontSize = 12;
			temp.text = "35/100";
			temp.textAlign = "center";
			temp.color = 0xffffff;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 92;
			temp.x = 42;
			temp.y = 0;
			return temp;
		}

		private function skinBar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			skinBar = temp;
			temp.name = "skinBar";
			temp.styleClass = org.mokylin.skin.component.progress.progress_jindutiao4;
			temp.value = 100;
			temp.width = 157;
			temp.x = 8;
			temp.y = 3;
			return temp;
		}

	}
}