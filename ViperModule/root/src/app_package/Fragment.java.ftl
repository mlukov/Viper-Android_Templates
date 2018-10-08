package ${packageName};

import android.app.Fragment;

<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>

import android.content.res.Configuration;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;


public class ${className}Fragment extends Fragment implements ${className}PresenterOutput {

	//region static fields
    public static final String TAG = ${className}Fragment.class.getSimpleName();

	protected static final String PRESENTER_KEY = "${className}Fragment.mPresenter";
	protected static final String PARAMETER1_KEY = "${className}Fragment.parameter1";
    protected static final String PARAMETER2_KEY = "${className}Fragment.parameter2";
	//endregion static fields
	
	//region private fields	
	private ${className}PresenterInput mPresenter;
	//endregion private fields

	//region get / set
    protected ${className}PresenterInput getPresenter() {

        return mPresenter;
    }
	
	@Override
    public void setPresenter( ${className}PresenterInput presenter ) {

        mPresenter = presenter;
    }
	//endregion get / set
	
	//region construction
	public ${className}Fragment() {
    }

    public static ${className}Fragment newInstance( final String parameter1, final String parameter2 ) {

        ${className}Fragment fragment = new ${className}Fragment();
		
		Bundle bundle = new Bundle();
        bundle.putString( PARAMETER1_KEY, parameter1 );
        bundle.putString( PARAMETER2_KEY, parameter2 );
        fragment.setArguments( bundle );

        return fragment;
    }
	//endregion construction
	
	//region Fragment overrides
    @Override
    public void onCreate( Bundle savedInstanceState ) {

        super.onCreate( savedInstanceState );
			
	if( savedInstanceState != null ) {

            ${className}PresentationConfigurator.configure${className}( this, (${className}Presenter )savedInstanceState.getSerializable( PRESENTER_KEY ) );
        }
	else {

            final String parameter1 = getArguments().getString( PARAMETER1_KEY );
            final String parameter2 = getArguments().getString( PARAMETER2_KEY );
        	${className}PresentationConfigurator.configure${className}( this, parameter1, parameter2 );
        }
		
	getPresenter().onViewInitilized();
    }

    @Override
    public View onCreateView( LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState ) {

        FrameLayout view = (FrameLayout)inflater.inflate( R.layout.your_fragment_layout, container, false );
	
        //
		//... Init view contorls
		//
        getPresenter().onViewCreated();

        return view;
    }
	
	@Override
    public void onConfigurationChanged( Configuration newConfig ) {

        super.onConfigurationChanged( newConfig );
        ...
    }

    @Override
    public void onResume() {

        super.onResume();

        if( getPresenter() != null )
            getPresenter().onViewShow( getActivity() );
    }
	
	@Override
    public void onPause() {

        if( getPresenter() != null )
            getPresenter().onViewHide();

        super.onPause();
    }
	
	@Override
    public void onSaveInstanceState( Bundle outState ) {

        super.onSaveInstanceState( outState );

        outState.putSerializable( PRESENTER_KEY, mPresenter );
    }
	//endregion Fragment overrides
	
	//region private methods
	private void showWaitDialogIfNotVisible( final String waitDialogMessage ) {


    }
	//endregion private methods

	
	//region ${className}PresenterOutput implementation
    @Override
    public void showWaitDialog( final String message ){

        showWaitDialogIfNotVisible( message );
    }
	
	@Override
    public void setTitle( final String title ){

        if ( getActivity() == null || getActivity().getActionBar() == null )
            return;

        getActivity().getActionBar().setTitle( title );
    }
	
	@Override
    public void initInterface(){
		
		...
	}
	//endregion ${className}PresenterOutput implementation
}
