package ${packageName};
 
import android.support.annotation.Nullable;


public class ${className}Interactor implements ${className}InteractorInput {

	//region private members
	private static final String LOG_TAG = ${className}Interactor.class.getSimpleName();
	
	private ${className}InteractorOutput mPresenter;
	//endregion private members
	
	//region Construction
    public ${className}Interactor( @Nullable ${className}InteractorOutput presenter ) {

        mPresenter = presenter;
    }

    //endregion Construction

    //region get/set
	@Nullable
    protected ${className}InteractorOutput getPresenter() {

        return mPresenter;
    }
	//region get/set
	
	
	//region protected methods
   
	//endregion protected methods

	//region IInteractor implementation
    @Override
    public void onDestroy() {

    }
    //endregion IInteractor implementation

	
	//region ${className}InteractorInput implementation

	//endregion ${className}InteractorInput implementation
	
}
