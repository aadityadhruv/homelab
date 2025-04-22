Name: k9s
Version: 0.27.4
Release: %autorelease
Summary: A Kubernetes CLI To Manage Your Clusters

License: Apache-2.0
URL: https://github.com/derailed/k9s
Source0: https://github.com/derailed/k9s/archive/refs/tags/v%{version}.tar.gz


BuildRequires: golang, make, git


%description
K9s provides a terminal UI to interact with your Kubernetes clusters. 


%global debug_package %{nil}
%prep
%autosetup -n k9s-%{version}


%build
make build


%install
mkdir %{buildroot}%{_bindir} -p
cp ./execs/k9s %{buildroot}%{_bindir}

%files
%{_bindir}/k9s


%changelog
%autochangelog

